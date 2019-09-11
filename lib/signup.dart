import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/api_sevices.dart';
import 'package:flutter_app/post_register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatelessWidget {

  final Future<PostRegister> post;
  Signup({Key key, this.post}) : super(key: key);
//  static final CREATE_POST_URL = 'https://prodevmatatu.herokuapp.com/api/user/registration';



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

  final formKey = GlobalKey<FormState>();

  static final CREATE_USER_URL = 'https://prodevmatatu.herokuapp.com/api/user/registration';

  TextEditingController _emailRegisterController = new TextEditingController();
  TextEditingController _usernameRegisterController = new TextEditingController();
  TextEditingController  _passwordRegisterController= new TextEditingController();
  String url = 'https://prodevmatatu.herokuapp.com/api/user/registration';

  Future<String> newUser() async {
    var response = await http
        .post(Uri.encodeFull(url), body: json.encode({

      "username": _usernameRegisterController.text,
      "email": _emailRegisterController.text,
      "password_hash": _passwordRegisterController.text,
    }), headers: { "content-type" : "application/json",
      "accept" : "application/json",});

    print(response.body);

  }

//  PostRegister createPost() => PostRegister();


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
    ),
      child: Column(
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
    ),Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 40),
        child: Column(


          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                ),controller: _emailRegisterController,
              ),
            ),




            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                    color: Colors.grey,
                  ),
                  hintText: 'Username',
                ),
                controller: _usernameRegisterController,
              ),
            ),




            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
                controller: _passwordRegisterController,
              ),
            ),


            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 32
                ),
              ),
            ),
            Spacer(),

            Container(
              height: 45,
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2D2B60 ),
                      Color(0xFF2596A8)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  )
              ),
              child: Center(

                child: InkWell(
                  onTap: () async {
                    if(_emailRegisterController.text.isEmpty || _passwordRegisterController.text.isEmpty || _usernameRegisterController.text.isEmpty){
                      showDialog(
                          builder:(context)=> AlertDialog(
                            title: Text('Failure'),
                            content: Text('You need to input the email, username and password'),
                            actions: <Widget>[FlatButton(
                              onPressed: (){Navigator.pop(context);},
                              child: Text('Ok'),
                            )],
                          ),
                          context: context
                      );
                      return;
                    }
                    else{
                      newUser();
                      Navigator.pushNamed(context, "/details");
                    }
//                    final post ={
//                      "username" : _usernameRegisterController.text,
//                      "password_hash": _passwordRegisterController.text,
//                      "email" : _emailRegisterController.text
//                    };
//                    ApiService.createPost(post)
//                        .then((success){
//                      String title, text;
//                      if(success){
//                        title= "Success";
//                        text= "You have succesfully SignedUp";
//                      }else{
//                        title= "Error";
//                        text= "An error occurred. Try again later";
////                        Navigator.pushNamed(context, "/details");
//                      }
//                      showDialog(
//                          builder:(context)=> AlertDialog(
//                             title: Text(title),
//                        content: Text(text),
//                        actions: <Widget>[FlatButton(
//                          onPressed: (){Navigator.pop(context);},
//                          child: Text('Ok'),
//                        )],
//                      ),
//                          context: context
//                      );
//                    });
                  },
                  child: Text('Signup'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
    ),
    ),
        ),
        ),
    );
  }
}







