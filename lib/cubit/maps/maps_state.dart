// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<dynamic> places;
  PlacesLoaded(
    this.places,
  );
}

class PlaceLocationLoaded extends MapsState {
  final Place place;
  PlaceLocationLoaded(
    this.place,
  );
}

class DirectionsLoaded extends MapsState {
  final PlaceDirecitons placeDirecitons;
  DirectionsLoaded(
    this.placeDirecitons,
  );
}
