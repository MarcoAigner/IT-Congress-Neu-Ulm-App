import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LectureCard extends StatelessWidget {
  String title;
 String lecturers;
  String category;
  String description;

  LectureCard(this.title, this.lecturers, {this.category, this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   if(category == null ){
     return Card(
       child: Column(
         children: <Widget>[
           Center(child: Text(title.toString(),style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
           Center(child: Text(lecturers.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.center,))
         ],
       ),
     );
   }
   else if(category != null){
     return Card(
       child: Column(
         children: <Widget>[
           Center(child: Text(title.toString(),style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
           Center(child: Text(lecturers.toString(), style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)),
           Center(child: Text(category.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.center,))
         ],
       ),
     );
   }
  }
}
