import 'package:flutter/cupertino.dart';

class EventsWidget extends StatefulWidget{

  EventsWidget();

  @override
  createState() => EventsWidgetState();


}

class EventsWidgetState extends State<EventsWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Events\nTo be realized",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center, );
  }

}
