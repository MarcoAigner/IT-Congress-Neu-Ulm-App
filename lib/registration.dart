import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget{

 Registration({@required this.onPressed});

 final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      fillColor: Colors.green,
      splashColor: Colors.lightGreen,
      onPressed: onPressed,
      shape: CircleBorder(),

      child: Text("Anmelden"),

    );
  }

}
