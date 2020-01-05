import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_congress/lecture-card.dart';

class EventCard extends StatelessWidget{
  String time;
  List <LectureCard> lectures;

  EventCard(this.time,{this.lectures});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Card(
     child: Text(time,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
   );
  }
}
