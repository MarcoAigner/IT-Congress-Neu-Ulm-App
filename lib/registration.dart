import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //form key and text editing controllers to validate user input
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

  //Global variables to store user input in
  String firstName;
  String lastName;
  String mailAddress;
  String currentTime;

  //Registration of user within the rest-database using an http POST
  void makePostRequest() async {
    //Database url
    String url = 'https://itkongress-c3cf.restdb.io/rest/participant?';
    //Database access and body format declaration
    Map<String, String> headers = {
      "content-type": "application/json",
      "x-apikey": "9f7807fc5f7739fb571d79bb28ddf7ae311ed",
      "cache-control": "no-cache"
    };

    //Assembly of the database body based on global variables
    String body = '{"first_name": "' +
        firstName +
        '", "last_name": "' +
        lastName +
        '", "email": "' +
        mailAddress +
        '", "signup_date": "' +
        DateTime.now().toLocal().toUtc().toString() +
        '"}';

    //POST request that return a response
    Response response = await post(url, headers: headers, body: body);

    //Debug
    print(response.statusCode.toString() +
        "\n" +
        response.headers.toString() +
        "\n" +
        response.body.toString());

    //Http 201: Created
    if (response.statusCode == 201) {
      //Back to Homepage
      Navigator.pop(context, "Sie haben sich erfolgreich angemeldet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anmeldung", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Form(
              //Validation logic
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
                          this.lastName =
                              text[0].toUpperCase() + text.substring(1);
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Nachname",
                            border: OutlineInputBorder()),
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
                        child: Builder(
                          builder: (BuildContext context) {
                            return FloatingActionButton.extended(
                              heroTag: 'fab',
                              label: Text(
                                "Anmelden",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  makePostRequest();
                                } else {}
                              },
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
