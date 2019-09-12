
import 'dart:convert';
import 'package:flutter_app/post_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';





class Login extends StatelessWidget {

  final Future<PostLogin> post;
  Login({Key key, this.post}) : super(key: key);

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
class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();


  static final CREATE_LOGINPOST_URL = 'https://prodevmatatu.herokuapp.com/api/user/login';

  TextEditingController _emailController =new  TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String url = 'https://prodevmatatu.herokuapp.com/api/user/login';

  Future<String> loginUser() async {
    var response = await http
        .post(Uri.encodeFull(url), body:json.encode({

      "email": _emailController.text,
      "password_hash": _passwordController.text,
    }), headers: { "content-type" : "application/json",
      "accept" : "application/json"});

    print(response.body);

    final int statusCode =response.statusCode;
    if (statusCode< 200 || statusCode>400 || json == null) {
      throw new Exception (" Error while posting data ");
    }


  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.5,
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
                          child: Text('Login',
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

                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.only(top: 62),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
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
                          ),
                          controller: _emailController,
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
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
                            icon: Icon(Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Password',
                          ),
                          controller: _passwordController,
                        ),
                      ),


                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/route");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, right: 32
                            ),
                            child: Text('Forgot Password ?',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),

                          ),
                        ),
                      ),
                      Spacer(),

                      Container(
                          height: 45,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF2D2B60),
                                  Color(0xFF2596A8)
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)
                              )
                          ),

                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                                    showDialog(
                                        builder:(context)=> AlertDialog(
                                          title: Text('Failure'),
                                          content: Text('You need to input the email and password'),
                                          actions: <Widget>[FlatButton(
                                            onPressed: (){Navigator.pop(context);},
                                            child: Text('Ok'),
                                          )],
                                        ),
                                      context: context
                                    );
                                    return;
                                  }else{
                                    loginUser();
                                    Navigator.pushNamed(context, "/details");
                                  }
//                                  final post ={
//                                    'email': _emailController.text,
//                                    'password_hash': _passwordController.text
//                                  };
//                                  ApiService.addPost(post)
//                                  .then((success){
//                                    String title, text;
//                                    if(success){
//                                      title= "Success";
//                                      text= "You have succesfully LoggedIn";
//                                    }else{
//                                      title= "Error";
//                                      text= "An error occurred. Try again later";
////                                    Navigator.pushNamed(context, "/details");
//
//
//                                    }
//                                    showDialog(
//                                        builder:(context)=> AlertDialog(
//                                          title: Text(title),
//                                          content: Text(text),
//                                          actions: <Widget>[FlatButton(
//                                            onPressed: (){Navigator.pop(context);},
//                                            child: Text('Ok'),
//                                          )],
//                                        ),
//                                        context: context
//                                    );
//                                  });
                                },

                                child: Text('Login'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                              )
                          )


                      ),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, right: 32
                            )
                            ,
                            child: Text("Don't have an Account? Create one",
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),

                          ),
                        ),
                      )
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
void main() => runApp(LoginPage());