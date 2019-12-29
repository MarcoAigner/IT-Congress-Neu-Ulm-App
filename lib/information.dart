import 'package:flutter/cupertino.dart';

class InformationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("IT Kongress Neu-Ulm\nEntwickelt von Studenten der HNU\nName1\nName2\netc\nKontaktinfos",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center, )

      )
    );
  }

  InformationPage();


}


