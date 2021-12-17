import 'package:flutter/material.dart';
import '../../../Food/model/food.dart';

class ProfileFoodInfo extends StatelessWidget {
  Place food;

  ProfileFoodInfo(this.food);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final food = Text(
      this.food.name,
      style: TextStyle(
          fontFamily: 'Lato', fontSize: 20.0, fontWeight: FontWeight.bold),
    );

    final foodInfo = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.food.description,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                this.food.dificulty,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              )
            ]));

    final card = Container(
      width: screenWidth * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              food,
              foodInfo,
            ],
          )),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[card],
    );
  }
}
