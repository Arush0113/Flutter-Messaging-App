import 'package:flutter/material.dart';
import '../models/engagements_model.dart';

class EngagementsTiles extends StatefulWidget {
  @override
  _EngagementsTilesState createState() => _EngagementsTilesState();
}

class _EngagementsTilesState extends State<EngagementsTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      child: engagements.isEmpty ?
      // Image.asset('assets/engagements_icon_1.png', fit: BoxFit.cover,) :
      Container(
        child: Center(
          child: Text(
            "You don't have any\nengagements Today !",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 28),
          ),
        ),
      ) :
      ListView.builder(
        itemCount: engagements.length,
        itemBuilder: (context, index) {
          final engagement = engagements[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // foregroundDecoration: BoxDecoration(),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(engagement.engagementType)
              ],
            ),
          );
        },
      ),
    );
  }
}
