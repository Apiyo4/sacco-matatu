import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFB415B),
          fontFamily: "Ubuntu"
      ),
      home: SignupPage(),
    );
  }
}
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
    child: Container(
    child: Column(
    children: <Widget>[
    Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height/2.5,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
    Color(0xFF2D2B60),
    Color(0xFF2596A8)
    ],
    ),
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(90),

    )
    ),child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Spacer(),



    Align(
    alignment: Alignment.center,
    child: Icon(Icons.person,
    size: 90,
    color: Colors.white,
    ),
    ),
    Spacer(),




    Align(
    alignment: Alignment.bottomRight,
    child: Padding(
    padding: const EdgeInsets.only(
    bottom: 32,
    right: 32
    ),
    child: Text('Signup',
    style: TextStyle(
    color: Colors.white,
    fontSize: 18
    ),
    ),
    ),
    ),
    ],
    ),
    ),
