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
}
}