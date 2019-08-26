import 'package:flutter/material.dart';

class records extends StatelessWidget
{
//  Records():super(builder: BuildContext context)
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Matatu Sacco",
        home: new Text("Hello"),
        theme: new ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.tealAccent
        )
    );
  }
}