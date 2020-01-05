import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget{
  People();

  @override
  createState() =>  PeopleState();
}

class PeopleState extends State<People>{
  List data;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/json/person.json'),
          builder: (context, snapshot){
            var new_data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Name: " +new_data["people"][index]["name"],style: TextStyle(fontSize: 20),),
                      Text("Age: " +new_data["people"][index]["age"],style: TextStyle(fontSize: 20)),
                      Text("Gender: " +new_data["people"][index]["gender"],style: TextStyle(fontSize: 20))
                    ],
                  ),
                );
              },
              itemCount: new_data == null ? 0 : new_data["people"].length,
            );
          },
        ),
      ),
    );
  }
}
