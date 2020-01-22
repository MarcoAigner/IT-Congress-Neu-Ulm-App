import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'dart:convert';

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
    //FutureBuilder is capable of asynchronous loading => useful when json is moved onto HNU's servers
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/mock.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          //Dynamic rendering of a list
          return ListView.builder(
            itemBuilder: (context, timeslotIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      //Each time slot is represented in a card widget
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Stack(
                                children: <Widget>[
                                  //At the top of every card there is the time of the current time slot
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
                            //Below the time there ia a number of n sub cards, each representing a single event
                            ListView.builder(
                                physics: ClampingScrollPhysics(),
                                itemCount: newData == null
                                    ? 0
                                    : newData["timeslots"][timeslotIndex]
                                            ["events"]
                                        .length,
                                shrinkWrap: true,
                                itemBuilder: (context, eventIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    //If there is a description, the card is rendered an expendable widget
                                    //If not, just a plain card is rendered
                                    child: ConditionalBuilder(
                                      condition: (newData["timeslots"]
                                                  [timeslotIndex]["events"]
                                              [eventIndex]["description"] !=
                                          null),
                                      builder: (context) => ExpansionTile(
                                        title: Text(
                                          newData["timeslots"][timeslotIndex]
                                                      ["events"][eventIndex]
                                                  ["title"]
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: ConditionalBuilder(
                                            condition: (newData["timeslots"]
                                                            [timeslotIndex]
                                                        ["events"][eventIndex]
                                                    ["lecturers"] !=
                                                null),
                                            builder: (context) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    newData["timeslots"][
                                                                        timeslotIndex]
                                                                    ["events"]
                                                                [eventIndex]
                                                            ["lecturers"]
                                                        .toString()
                                                        .substring(
                                                            1,
                                                            newData["timeslots"][timeslotIndex]["events"]
                                                                            [
                                                                            eventIndex]
                                                                        [
                                                                        "lecturers"]
                                                                    .toString()
                                                                    .length -
                                                                1),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                        children: <Widget>[
                                          ConditionalBuilder(
                                              condition: (newData["timeslots"]
                                                              [timeslotIndex]
                                                          ["events"][eventIndex]
                                                      ["category"] !=
                                                  null),
                                              builder: (context) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      newData["timeslots"][
                                                                          timeslotIndex]
                                                                      ["events"]
                                                                  [eventIndex]
                                                              ["description"]
                                                          .toString(),
                                                    ),
                                                  ))
                                        ],
                                      ),
                                      fallback: (context) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            newData["timeslots"][timeslotIndex]
                                                        ["events"][eventIndex]
                                                    ["title"]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          ConditionalBuilder(
                                              condition: (newData["timeslots"]
                                                              [timeslotIndex]
                                                          ["events"][eventIndex]
                                                      ["lecturers"] !=
                                                  null),
                                              builder: (context) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      newData["timeslots"][
                                                                          timeslotIndex]
                                                                      ["events"]
                                                                  [eventIndex]
                                                              ["lecturers"]
                                                          .toString()
                                                          .substring(
                                                              1,
                                                              newData["timeslots"]
                                                                              [
                                                                              timeslotIndex]["events"][eventIndex]
                                                                          [
                                                                          "lecturers"]
                                                                      .toString()
                                                                      .length -
                                                                  1),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                        ],
                                      ),
                                    ),
                                  );
                                })
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
