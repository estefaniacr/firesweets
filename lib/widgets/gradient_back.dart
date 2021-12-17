import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  double height = 0.0;
  GradientBack(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.purple.shade400,
                Colors.indigo.shade400,
                Colors.lightBlue.shade300
              ],
              begin: FractionalOffset(0.0, 0.2),
              end: FractionalOffset(1.0, 1.6),
              stops: [0.0, 0.6, 1.0],
              tileMode: TileMode.clamp)),
    );
  }
}
