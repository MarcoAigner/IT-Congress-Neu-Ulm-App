import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImpressumWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/it_logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("IT Kongress Neu-Ulm 2019", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
        ),
        Padding(
        padding: EdgeInsets.all(8.0),
          child: Text("Hochschule für angewandte Wissenschaften Neu-Ulm", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
              child: Text("info@it-kongress.com", style: TextStyle(color: Colors.blue, fontSize: 20),),
          onTap: () => launch("mailto:info@it-kongress.com"),),
        ),
      ],
    );
  }

  ImpressumWidget();


}


