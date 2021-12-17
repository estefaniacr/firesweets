import 'package:flutter/material.dart';


class DescriptionFood extends StatelessWidget {
  String nameFood;
  //int stars;
  String descriptionFood;

  DescriptionFood(this.nameFood, this.descriptionFood);

  @override
  Widget build(BuildContext context) {

    final description = Container(
      margin: new EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
      child: Column (children: [
        Text(
            nameFood,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 25.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
                SizedBox(height: 30.0,),
          Text(
        descriptionFood,
        style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF56575a)),
      ),
      ],)
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [description],
    );
  }
}
