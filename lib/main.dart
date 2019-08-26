
import 'package:flutter/material.dart';

import 'splash.dart';
import 'login.dart';
import 'signup.dart';

var routes = <String, WidgetBuilder>{
  "/login":(BuildContext context) => LoginPage(),
  "/signup":(BuildContext context) => SignupPage(),
//  "/details": (BuildContext context)=> DetailsPage()
};
void main() => runApp(MaterialApp(
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.blue,
),
  debugShowCheckedModeBanner: false,
  home: Splash(),
  routes: routes,

));