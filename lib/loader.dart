import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';


class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialradius = 25.0;
  double radius =0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation_rotation= Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear))); //RotationAnimation




    animation_radius_in= Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.elasticIn))); //CurvedAnimation

    animation_radius_out= Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25, curve: Curves.elasticOut))); //CurvedAnimation


    controller.addListener((){

      setState(() {
        if(controller.value>= 0.75 && controller.value<=1.0){
          radius= animation_radius_in.value * initialradius;
        }
        else if(controller.value>=0.0 && controller.value<= 0.25){
          radius = animation_radius_out.value * initialradius;
        }
      });

    });
    controller.repeat();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 25.0,
                color: Colors.black12,
              ),
              Transform.translate(
                  offset: Offset(radius * cos(pi/4), radius* sin(pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white,
                  )
              ),

              Transform.translate(
                  offset: Offset(radius * cos(2*pi/4), radius* sin(2*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white30,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(3*pi/4), radius* sin(3*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(4*pi/4), radius* sin(4*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white30,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(5*pi/4), radius* sin(5*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(6*pi/4), radius* sin(6*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white30,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(7*pi/4), radius* sin(7*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white,
                  )
              ),
              Transform.translate(
                  offset: Offset(radius * cos(8*pi/4), radius* sin(8*pi/4)),

                  child: Dot(
                    radius: 5.0,
                    color: Colors.white30,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;
  final double radius;
  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height:this.radius,
        decoration:BoxDecoration(
            color: this.color,
            shape:BoxShape.circle
        ),
      ),
    );
  }
}

