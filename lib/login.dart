import 'package:first_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFB415B),
          fontFamily: "Ubuntu"
      ),
      home: LoginPage(),
    );

  }
}
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}
