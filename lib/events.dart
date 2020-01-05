import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_congress/event-card.dart';
import 'package:it_congress/json-congress.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:it_congress/json-event.dart';
import 'package:it_congress/json-person.dart';
import 'package:it_congress/lecture-card.dart';

class EventsWidget extends StatefulWidget {
  EventsWidget();

  int numberEvents = 0;

  @override
  createState() => EventsWidgetState();
}

class EventsWidgetState extends State<EventsWidget> {
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
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(newData["timeslots"][timeslotIndex]["time"],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ),
                          ListView.builder(
                            itemBuilder: (context, eventIndex) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 1.0)
                                  ]),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              newData["timeslots"][timeslotIndex]
                                                      ["events"][eventIndex]
                                                  ["title"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Text(newData["timeslots"][timeslotIndex]
                                                              ["events"]
                                                          [eventIndex]
                                                      ["lecturers"]
                                                  .toString() ??
                                              ""),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: newData == null
                                ? 0
                                : newData["timeslots"][timeslotIndex]["events"]
                                    .length,
                            //Handles the correct sizing while using nested list views
                            shrinkWrap: true,

                            //deactivates scrolling for the inner list views
                            physics: ClampingScrollPhysics(),
                          ),
                        ],
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
