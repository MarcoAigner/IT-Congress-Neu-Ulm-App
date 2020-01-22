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
                                    child: ExpansionTile(
                                    title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      newData["timeslots"][timeslotIndex]
                                                  ["events"][eventIndex]
                                              ["title"]
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    ),
                                    subtitle: ConditionalBuilder(
                                      condition: (newData["timeslots"]
                                                  [timeslotIndex]["events"]
                                              [eventIndex]["lecturers"] !=
                                          null),
                                      builder: (context) => Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Text(
                                              newData["timeslots"][timeslotIndex]
                                                              ["events"]
                                                          [eventIndex]
                                                      ["lecturers"]
                                                  .toString()
                                                  .substring(
                                                      1,
                                                      newData["timeslots"][timeslotIndex]
                                                                          ["events"]
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                                newData["timeslots"][
                                                                timeslotIndex]
                                                            ["events"][
                                                        eventIndex]["description"]
                                                    .toString(),
                                              ),
                                        ))
                                    ],
                                    ),
                                  );
                                })
                            /*ListView.builder(
                              itemCount: newData == null
                                  ? 0
                                  : newData["timeslots"][timeslotIndex]
                              ["events"]
                                  .length ,
                                shrinkWrap: true,
                                itemBuilder: (
                              context,
                              eventIndex,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: ExpandablePanel(
                                    tapHeaderToExpand: false,
                                    iconColor: Colors.lightGreen,
                                    tapBodyToCollapse: false,
                                    hasIcon: true,
                                    header: Text(
                                      newData["timeslots"][timeslotIndex]["events"]
                                              [eventIndex]["title"]
                                          .toString(),
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20)
                                    ),
                                    collapsed: Text("Test collapsed"),
                                    expanded: Text("Test expanded"),
                                  ),
                                ),
                              );
                            })*/
                            /*GestureDetector(
                              onTap: () =>
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  "Detailansicht in Arbeit",
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.lightGreen,
                                duration: Duration(seconds: 2),
                              )),
                              child: ListView.builder(
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
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                  newData["timeslots"]
                                                              [timeslotIndex]
                                                          ["events"][eventIndex]
                                                      ["title"],
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              ConditionalBuilder(
                                                  condition: (newData["timeslots"]
                                                                  [
                                                                  timeslotIndex]
                                                              [
                                                              "events"][eventIndex]
                                                          ["lecturers"] !=
                                                      null),
                                                  builder: (context) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 15),
                                                        child: Text(
                                                          newData["timeslots"][
                                                                              timeslotIndex]
                                                                          [
                                                                          "events"]
                                                                      [
                                                                      eventIndex]
                                                                  ["lecturers"]
                                                              .toString()
                                                              .substring(
                                                                  1,
                                                                  newData["timeslots"][timeslotIndex]["events"][eventIndex]
                                                                              [
                                                                              "lecturers"]
                                                                          .toString()
                                                                          .length -
                                                                      1),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: ConditionalBuilder(
                                                  condition: (newData["timeslots"]
                                                                  [
                                                                  timeslotIndex]
                                                              [
                                                              "events"][eventIndex]
                                                          ["category"] !=
                                                      null),
                                                  builder: (context) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0),
                                                    child: Text(
                                                      newData["timeslots"][
                                                                  timeslotIndex]
                                                              ["events"][
                                                          eventIndex]["category"],
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightGreen, fontWeight: FontWeight.bold),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 20.0),
                                                child: Icon(Icons.expand_more),
                                              ),
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
                            ),*/
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
