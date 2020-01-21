import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mailController.dispose();
    super.dispose();
  }

  String firstName;
  String lastName;
  String mailAddress;
  String currentTime;

  void makePostRequest() async {
    // Configuration for rest-db connection
    String url = 'https://itkongress-c3cf.restdb.io/rest/participant?';
    Map<String, String> headers = {
      "content-type": "application/json",
      "x-apikey": "9f7807fc5f7739fb571d79bb28ddf7ae311ed",
      "cache-control": "no-cache"
    };

    //Assign the payload values
    String json = '{"first_name": "' +
        firstName +
        '", "last_name": "' +
        lastName +
        '", "email": "' +
        mailAddress +
        '", "signup_date": "' +
        DateTime.now().toLocal().toUtc().toString() +
        '"}';

    //Make POST request
    Response response = await post(url, headers: headers, body: json);

    //Debug
    print(response.statusCode.toString() +
        "\n" +
        response.headers.toString() +
        "\n" +
        response.body.toString());

    if (response.statusCode == 201) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anmeldung", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onChanged: (String text) {
                      this.firstName =
                          text[0].toUpperCase() + text.substring(1);
                    },
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Vorname", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.length < 2) {
                        return "Ein Name muss aus mindestens zwei Buchstaben bestehen";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onChanged: (String text) {
                      this.lastName = text[0].toUpperCase() + text.substring(1);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nachname", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.length < 2) {
                        return "Ein Name muss aus mindestens zwei Buchstaben bestehen";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    onChanged: (String text) {
                      this.mailAddress = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "E-Mail", border: OutlineInputBorder()),
                    validator: (value) {
                      if (!value.contains("@")) {
                        return "Bitte geben Sie eine gültige E-Mail Addresse an";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      heroTag: 'fab',
                      label: Text("Anmelden", style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          makePostRequest();
                        } else {}
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
