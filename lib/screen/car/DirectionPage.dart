import 'dart:async';
import 'package:driver_app/screen/car/pay_with_nfc.dart';
import 'package:driver_app/widgets/halper_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:driver_app/widgets/coustom_button.dart';
import '../../constants.dart';
import '../../widgets/digle.dart';

class DirectionPage extends StatefulWidget {
  final Position position;
  DirectionPage({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Completer<GoogleMapController> _mapController = Completer();
  late Position? position;
  late CameraPosition _myCurrentLocationCameraPosition;
  late Timer _timer;
  Duration _remainingTime =
      Duration(minutes: 5); // Set the initial countdown duration
  String _timerText = '05:00';

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - Duration(seconds: 1);
          _timerText = _formatDuration(_remainingTime);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes);
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  void _addMarkers() {
    _markers.add(Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(37.42796133580664, -122.085749655962),
    ));
    _markers.add(Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(37.42496133580664, -122.082749655962),
    ));
  }

  void _addPolyline() {
    _polylines.add(Polyline(
      polylineId: PolylineId('route1'),
      points: [
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.42496133580664, -122.082749655962),
      ],
      width: 3,
      color: Colors.blue,
    ));
  }

  @override
  initState() {
    super.initState();
    final position = widget.position;
    _myCurrentLocationCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(widget.position.latitude, widget.position.longitude),
      tilt: 0.0,
      zoom: 17,
    );
    _addMarkers();
    _addPolyline();
  }
/* 
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
  } */

  Future _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  final AssetImage _driverImageAsset =
      const AssetImage('assets/image/Ellipse.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icon/Arrow - Left.svg'),
            ),
            decoration: BoxDecoration(
              color: YallowColor,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 12,
            height: 12,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            polylines: _polylines,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _myCurrentLocationCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.23,
            minChildSize: 0.23,
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
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset('assets/icon/Frame.svg'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundImage: _driverImageAsset,
                                radius: 30.0,
                              ),
                              const SizedBox(width: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8.0),
                                  Text(
                                    ' Mohamed Ahmed',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    ' \$25',
                                    style: const TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.height / 8,
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
                          padding: const EdgeInsets.symmetric(vertical: 18),
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
                                width: MediaQuery.of(context).size.height / 30,
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
                                    height:
                                        MediaQuery.of(context).size.height / 40,
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
                                width: MediaQuery.of(context).size.height / 20,
                              ),
                              Column(
                                children: [
                                  const Text('0 KM'),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                  ),
                                  const Text('20 KM')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: PrimaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 44,
                                  width: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/icon/Chat.svg',
                                    ),
                                  )),
                              const SizedBox(
                                width: 24,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: YallowColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 44,
                                  width: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: SvgPicture.asset(
                                      'assets/icon/Vector.svg',
                                    ),
                                  )),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 3),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: YallowColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        _timerText,
                                      ),
                                    ),
                                    width: 90,
                                    height: 40,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CoustomButton(
                            text: 'Strat Ride',
                            onTap: () {
                              setState(() {
                                _startTimer();
                              });
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        CoustomButton(
                            text: 'Trip is Done',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialog(
                                      header: 'Trip is Successful!',
                                      massage: 'You have successfully Trip ',
                                      imagePath: 'assets/image/Group.svg',
                                      buttonText: "paying off",
                                      onButtonPressed: () {
                                        context.push(new PayWithNfc());
                                      },
                                      buttonText2: "Payment completed",
                                      onButtonPressed2: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            })
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
