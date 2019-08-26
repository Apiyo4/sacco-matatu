import 'package:flutter/material.dart';

class TripDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:"Matatu Sacco",
        home: new Homepage(),
        theme: new ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.tealAccent
        )
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  String strStringData = "Trip Details";

@override
Widget build(BuildContext context) {
  final txtRoute = TextField(
    decoration: InputDecoration(
        hintText: "Route",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
  final txtPassengers = TextField(
    decoration: InputDecoration(
        hintText: "Number of Passengers",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
  final txtAmount = TextField(
    decoration: InputDecoration(
        hintText: "Fare",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
  final txtStation = TextField(
    decoration: InputDecoration(
        hintText: "Station",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
  final txtDriver = TextField(
    decoration: InputDecoration(
        hintText: "Name of driver",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
  final txtConductor = TextField(
    decoration: InputDecoration(
        hintText: "Name of conductor",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30.0))
    ),
  );
}
}