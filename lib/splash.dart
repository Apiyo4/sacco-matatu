import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),() => Navigator.pushNamed(context, "/login"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: new Color(0xFFFFFFFF),
                gradient: LinearGradient(
                  colors: [new Color(0xFF2596A8), new Color(0xFF2D2B60)],
                  begin: Alignment.centerRight,
                  end: new Alignment(-0.5, -0.5),
//              end: Alignment.centerLeft,
                )

            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF),
                radius: 60.0,
                child: Icon(
                  Icons.airport_shuttle,
                  color: Color(0xFF2596A8),
                  size: 70.0,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 100.0),
              ),

              Loader()

            ],
          )
        ],
      ),
    );

  }
}





