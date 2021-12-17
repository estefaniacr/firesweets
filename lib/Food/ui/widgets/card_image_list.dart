import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage("assets/img/cheescake.jpeg"),
          CardImage("assets/img/cheescake_tuna.jpeg"),
          CardImage("assets/img/cheescake_one.jpeg"),
          CardImage("assets/img/cheescake_two.jpeg")
        ],
      ),
    );
  }
}
