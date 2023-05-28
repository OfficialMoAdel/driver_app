import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/PlaceSuggestion.dart';
import '../model/place.dart';
import '../model/place_diraction.dart';
import '../webServices/PlaceWebServices.dart';

class MapsRepository {
  final PlacesWebSevices placesWebSevices;
  MapsRepository(this.placesWebSevices);

  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestion =
        await placesWebSevices.fetchSuggestions(place, sessionToken);
    return suggestion
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placesWebSevices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);
  }

  Future<PlaceDirecitons> getDiractions(
      LatLng origin, LatLng destination) async {
    final directions =
        await placesWebSevices.getDiractions(origin, destination);

    return PlaceDirecitons.fromJson(directions);
  }
}
