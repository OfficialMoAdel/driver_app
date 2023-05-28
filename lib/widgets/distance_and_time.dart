// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../model/place_diraction.dart';

class DistanceAndTime extends StatelessWidget {
  final PlaceDirecitons? placeDirecitons;
  final isTimeAndDistanceVisible;
  const DistanceAndTime({
    Key? key,
    this.placeDirecitons,
    required this.isTimeAndDistanceVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isTimeAndDistanceVisible,
        child: Positioned(
          top: 0,
          bottom: 570,
          right: 0,
          left: 0,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  color: Colors.white,
                  child: ListTile(
                    dense: true,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.access_time_filled,
                      color: Colors.blue,
                    ),
                    title: Text(
                      placeDirecitons!.totalDuration,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                flex: 1,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  color: Colors.white,
                  child: ListTile(
                    dense: true,
                    horizontalTitleGap: 0,
                    leading: Icon(
                      Icons.directions_car_filled,
                      color: Colors.blue,
                    ),
                    title: Text(
                      placeDirecitons!.totalDistance,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
