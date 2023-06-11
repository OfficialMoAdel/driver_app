import 'dart:async';
import 'package:driver_app/screen/car/DirectionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../cubit/maps/maps_cubit.dart';
import '../../model/location_helper.dart';
import '../../model/PlaceSuggestion.dart';
import '../../model/place.dart';
import '../../model/place_diraction.dart';
import '../../constants.dart';
import '../../widgets/place_item.dart';
import '../../widgets/socal_card.dart';
import '../../widgets/toggle.dart';

class HomepageCar extends StatefulWidget {
  const HomepageCar({super.key});
  static String id = 'HomepageCar';

  @override
  State<HomepageCar> createState() => _HomepageCarState();
}

class _HomepageCarState extends State<HomepageCar> {
  bool isWidgetVisible = true;
  List<dynamic> places = [];
  TextEditingController searchController = TextEditingController();

  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

//these variables for getplaceLocation
  Set<Marker> markers = Set();

  late PlaceSuggestion placeSuggestion;
  late Place selactedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;

  void buildCameraNewPosition() {
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selactedPlace.result.geometry.location.lat,
        selactedPlace.result.geometry.location.lng,
      ),
      zoom: 13,
    );
  }

// these variables for getDirection
  PlaceDirecitons? placeDirecitons;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Future<void> getMyCurrentLocation() async {
    try {
      position = await LocationHelper.getCurrentLocation().whenComplete(() {
        setState(() {});
      });
    } catch (e) {
      // Handle the exception
      if (e is PermissionDeniedException) {
        // Show a dialog or prompt to the user asking for permission again
        // You can provide a button to open the app settings for the user to manually enable location permission
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Location Permission Required'),
            content:
                const Text('Please grant permission to access your location.'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  // Handle cancel action
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Open Settings'),
                onPressed: () {
                  // Open the app settings to let the user manually enable location permission
                  Geolocator.openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        // Handle other exceptions
        print('Error obtaining current location: $e');
      }
    }
  }

  Widget buildMap() {
    return GoogleMap(
      markers: markers,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
      polylines: placeDirecitons != null
          ? {
              Polyline(
                polylineId: const PolylineId('my_polyline'),
                color: Colors.black,
                points: polylinePoints,
                width: 5,
              )
            }
          : {},
    );
  }

  Future _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  void getPlacesSuggestions(String Qury) {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitplacesSuggestions(Qury, sessionToken);
  }

  Widget buildSuggestionsBloc() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = (state).places;
          if (places.length != 0) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationLoaded) {
          selactedPlace = (state).place;
          goToMySearchedLocation();
          getDiractions();
        }
      },
      child: Container(),
    );
  }

  void getDiractions() {
    BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
        LatLng(position!.latitude, position!.longitude),
        LatLng(selactedPlace.result.geometry.location.lat,
            selactedPlace.result.geometry.location.lng));
  }

  Widget buildDiractionsBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is DirectionsLoaded) {
          placeDirecitons = (state).placeDirecitons;
          getPolylinePoints();
        }
      },
      child: Container(),
    );
  }

  void getPolylinePoints() {
    polylinePoints = placeDirecitons!.polylinePoints
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
  }

  Future<void> goToMySearchedLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));

    buildSearchPlaceMarker();
  }

  void buildSearchPlaceMarker() {
    searchedPlaceMarker = Marker(
      markerId: MarkerId('1'),
      position: goToSearchedForPlace.target,
      onTap: () {
        buildCurrentLocationMarker();
        setState(() {
          isSearchPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(
        title: "${placeSuggestion.description}",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      markerId: MarkerId('2'),
      position: LatLng(position!.latitude, position!.longitude),
      onTap: () {},
      infoWindow: InfoWindow(
        title: "Your Current Location",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () async {
            placeSuggestion = places[index];

            // controller.Close;

            getSelactedPlaceLocation();
            polylinePoints.clear();
            //remove All markers and updata UI
            removeAllMarkersAndUpdataui();
          },
          child: PlaceItem(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void removeAllMarkersAndUpdataui() {
    markers.clear();
    setState(() {});
  }

  void getSelactedPlaceLocation() {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitPlaceLocation(placeSuggestion.placeId, sessionToken);
  }

  void _onDeclineButtonPressed() {
    setState(() {
      isWidgetVisible = false;
    });
  }

  int _toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: AnimatedToggle(
            values: ['Ofline', 'Online'],
            onToggleCallback: (value) {
              setState(() {
                _toggleValue = value;
              });
            },
            buttonColor: PrimaryColor,
            backgroundColor: ScandryColor,
            textColor: const Color(0xFFFFFFFF),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: YallowColor,
              child: SvgPicture.asset(
                'assets/icon/Arrow - Left.svg',
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: YallowColor,
            child: SvgPicture.asset(
              'assets/icon/Notification.svg',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 60,
          ),
          CircleAvatar(
            backgroundColor: YallowColor,
            child: InkWell(
              onTap: _goToMyCurrentLocation,
              child: SvgPicture.asset(
                'assets/icon/Location.svg',
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 50,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: PrimaryColor,
                    ),
                  ),
                ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return isWidgetVisible
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                                          radius: 30.0,
                                        ),
                                        const SizedBox(width: 12.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8.0),
                                            Text(
                                              ' Mohamed Ahmed',
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              ' \$25',
                                              style: const TextStyle(
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ),
                                        Column(
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                      child: SvgPicture.asset(
                                                    'assets/icon/stare.svg',
                                                    color: PrimaryColor,
                                                  )),
                                                  const TextSpan(text: ' 4.5'),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            const Text('HSW 4736')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                child: Image.asset(
                                              'assets/image/Location.png',
                                              height: 42,
                                            )),
                                            const VerticalDivider(
                                              endIndent: 8,
                                              indent: 8,
                                              thickness: 2,
                                            ),
                                            Container(
                                                child: Image.asset(
                                              'assets/image/map.png',
                                              height: 42,
                                            ))
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'National Grand Park',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '6 Glendale St. Worcester, MA 01604',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: ScandryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Fitness Center',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '83 Cypress Street Longwood, FL 32779',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: ScandryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        Column(
                                          children: [
                                            const Text('0 KM'),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  20,
                                            ),
                                            const Text('20 KM')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomButoonCard(
                                          backgroundColor: YallowColor,
                                          press: _onDeclineButtonPressed,
                                          text: 'Decline',
                                        ),
                                        CustomButoonCard(
                                          backgroundColor: PrimaryColor,
                                          press: () {
                                            if (position != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DirectionPage(
                                                    position:
                                                        position!, // Access the non-nullable position value using the '!' operator
                                                    key: ValueKey(
                                                        'directionPage'),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Accept',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
