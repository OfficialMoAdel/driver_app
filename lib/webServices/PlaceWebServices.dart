import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';

class PlacesWebSevices {
  late Dio dio;

  PlacesWebSevices() {
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }
  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(suggestionBaseurl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'kay': googleAPIKey,
        'sessiontoken': sessionToken,
      });
      return response.data['predictions'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }

  Future<dynamic> getDiractions(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        diractionBaseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleAPIKey,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }
}
