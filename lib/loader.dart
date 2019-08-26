import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}
class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialradius = 25.0;
  double radius = 0.0;

}
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

