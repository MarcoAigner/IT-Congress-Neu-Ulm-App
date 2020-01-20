import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:it_congress/json-congress.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:it_congress/json-event.dart';
import 'package:it_congress/json-person.dart';
import 'package:it_congress/lecture-card.dart';

class EventsWidget extends StatefulWidget {
  EventsWidget();

  @override
  createState() => EventsWidgetState();
}

class EventsWidgetState extends State<EventsWidget> {
  int numberEvents = 0;
  String currentLecturers = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/mock.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (context, timeslotIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Stack(
                                children: <Widget>[
                                  Text(
                                      newData["timeslots"][timeslotIndex]
                                          ["time"],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 0.1
                                            ..color = Colors.black)),
                                  Text(
                                    newData["timeslots"][timeslotIndex]["time"],
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.lightGreen,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemBuilder: (context, eventIndex) {
                                return Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 10)
                                    ]),
                                    child: Card(
                                      elevation: 15,
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                newData["timeslots"]
                                                            [timeslotIndex]
                                                        ["events"][eventIndex]
                                                    ["title"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            ConditionalBuilder(
                                                condition: (newData["timeslots"][
                                                                        timeslotIndex]
                                                                    ["events"]
                                                                [eventIndex]
                                                            ["lecturers"] !=
                                                    null),
                                                builder: (context) => Text(
                                                    newData["timeslots"]
                                                                        [timeslotIndex]
                                                                    ["events"]
                                                                [eventIndex]
                                                            ["lecturers"]
                                                        .toString()
                                                        .substring(1,newData["timeslots"]
                                                    [timeslotIndex]
                                                    ["events"]
                                                    [eventIndex]
                                                    ["lecturers"]
                                                        .toString().length-1))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: newData == null
                                  ? 0
                                  : newData["timeslots"][timeslotIndex]
                                          ["events"]
                                      .length,
                              //Handles the correct sizing while using nested list views
                              shrinkWrap: true,

                              //deactivates scrolling for the inner list views
                              physics: ClampingScrollPhysics(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: newData == null ? 0 : newData["timeslots"].length,
          );
        });
  }
}
