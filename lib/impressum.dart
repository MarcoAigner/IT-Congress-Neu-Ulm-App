import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImpressumWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/it_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Impressum"),
            )
          ],
        ),
      )
    );
  }

  ImpressumWidget();


}


