# IT Congress app

This is a hybrid app that, being written in Flutter, is able to run both on AndroidOS and iOS.
The app has two purposes:

1. It provides information about the event's of the annual IT-congress held at the university of applied sciences in Neu-Ulm.
2. It offers the possibility to sign up for the IT-congress, directly within the app.

The app was built as part of the elective subject "app development" 

<img src="https://i.imgur.com/mCDwOpO.jpg" width="800" alt="it-congress-app">

## Technical

The app accepts data about the IT-congress (events, speakers, times, location, additional information) in the JSON-format and dynamically renders those accordingly, based on what is provided or not.

Within the lecture the data was provided statically in form of a JSON-file, located within the project.
Theoretically, the app would be able to retrieve the JSON remotely, increasing the flexibility of the previous hard-coded tables of the homepage. 
Unfortunately, the lecture was purely theoretical and no project saw an opportunity of realization.

## Status Quo
The app is structured using a Bottom NavigationBar.
The Main Page contains a ListView including every timeslot and every event. Users can expand events to get further information.
The Second Page contains an impressum.
Using the prominent FloatingActionBottom at the lower center of the app, users get to the registration page, where they are able to sign up for the congress.


## (Planned) features

1. **DONE** The events dynamically render based on the data provided via a JSON-file.
2. **DONE** Implemented the registration process using Http-POSTs with front-end input validation.
3. **DONE** Detail views have been implemented using a conditional rendering that renders an expandable widget if a description is available

*The features below were planned, but could not be implemented within the scope of the lecture.
As it saw no chance of realization, the project was halted at this point.*

4. Implementation of a notify-function: Users can subscribe to events they're interested in, and get notified when they are about to start.
5. Implementation of a rating and communication system for the user to rate the event and provide further feedback through a text-input.


Marco Aigner

Under the supvervision of Prof. Dr. Philip Brune as part of the lecture "app development"
