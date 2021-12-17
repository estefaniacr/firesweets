import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String pathImage = "assets/img/cheescake_tuna.jpeg";
  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    final card = Container(
        height: 450.0,
        width: 300.0,
        margin: EdgeInsets.only(top: 60.0, left: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(pathImage)),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]));
    return Stack(
      alignment: Alignment(1.0, 1.1),
      children: [card],
    );
  }
}
