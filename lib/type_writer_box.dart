import 'package:flutter/material.dart';
import 'package:flutter_animates_typewriter/type_writer_text.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


class TypeWriterBox extends StatefulWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.lightBlueAccent[200],
      borderRadius: BorderRadius.all
        (Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 5
        )
      ]);

  @override
  _TypeWriterBoxState createState() => _TypeWriterBoxState();
}

class _TypeWriterBoxState extends State<TypeWriterBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Flutter Animates TypeWriter Box Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: PlayAnimation<double>(
          duration: 400.milliseconds,
          tween: 0.0.tweenTo(80.0),
          builder: (context, child, height) {
            return PlayAnimation<double>(
              duration: 1600.milliseconds,
              delay: 500.milliseconds,
              tween: 2.0.tweenTo(300.0),
              builder: (context, child, width) {
                return Container(
                  decoration: TypeWriterBox.boxDecoration,
                  width: width,
                  height: height,
                  child: typewriter(width)
                      ? TypeWriterText("Flutter Devs")
                      : Container(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  bool typewriter(double width) => width > 15;
}


