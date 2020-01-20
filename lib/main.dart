import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_congress/events.dart';
import 'package:it_congress/impressum.dart';
import 'package:url_launcher/url_launcher.dart';

import 'registration.dart';
import 'registration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Kongress Neu-Ulm',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.blueGrey,
          accentColor: Colors.lightGreen,
          fontFamily: 'Roboto'

      ),
      home: MyHomePage(title: 'IT Kongress Neu-Ulm'),
      routes: {
        '/registration': (context) => Registration(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentWidget = EventsWidget();

  List events;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    EventsWidget(),
    ImpressumWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openMail() async {
    const url =
        "mailto:info@hs-neu-ulm.de?subject=Anmeldung IT-Kongress 2020&body=Sehr geehrte Damen und Herren,\nich möchte mich hiermit für den IT-Kongress 2020 anmelden.\nMein Name ist ";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBody: true,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        /* floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(

            tooltip: "Anmeldung",
              child: Icon(Icons.group_add),
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              });
        }),*/
        floatingActionButton: FloatingActionButton(
            elevation: 4.0,
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
            child: Icon(Icons.group_add, color: Colors.white,)),
        body: Center(
          //child: _widgetOptions.elementAt(_selectedIndex),
          child: currentWidget,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 10.0,
          /* child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('Events'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  title: Text('Über'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.green,
              onTap: _onItemTapped)*/
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      textColor: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.event),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Veranstaltungen"),
                          )
                        ],
                      ),
                      onPressed: () {
                        if (currentWidget != EventsWidget()) {
                          setState(() {
                            currentWidget = _widgetOptions[0];
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MaterialButton(
                      textColor: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.info_outline),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Über"),
                          )
                        ],
                      ),
                      onPressed: () {
                        if (currentWidget != ImpressumWidget()) {
                          setState(() {
                            currentWidget = _widgetOptions[1];
                          });
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
