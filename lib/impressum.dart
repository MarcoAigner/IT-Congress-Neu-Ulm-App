import 'package:flutter/cupertino.dart';

class ImpressumWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Impressum\nTo be realized",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center, )

      )
    );
  }

  ImpressumWidget();


}


