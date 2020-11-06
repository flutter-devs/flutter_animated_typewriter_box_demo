import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';



class TypeWriterText extends StatelessWidget {
  static const Type_Writer_STYLE =
  TextStyle(letterSpacing: 5,
      fontSize: 20, fontWeight:
      FontWeight.w400,
      color: Colors.white);

  final String text;
  TypeWriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<int>(
        duration: 1000.milliseconds,
        delay: 1000.milliseconds,
        tween: 0.tweenTo(text.length),
        builder: (context, child, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength),
                  style: Type_Writer_STYLE
              ),
              _blinkingCursor()
            ],
          );
        });
  }

  Widget _blinkingCursor() {
    return LoopAnimation<int>(
      duration: 800.milliseconds,
      tween: 0.tweenTo(1),
      builder: (context, child, oneOrZero) {
        return Opacity(
            opacity: oneOrZero == 1 ?
            1.0 : 0.0,
            child: Text("_", style:
            Type_Writer_STYLE)
        );
      },
    );
  }
}
