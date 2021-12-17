import 'package:flutter/material.dart';
import 'profile_sweet.dart';
import '../../../Food/model/food.dart';

class ProfileFoodList extends StatelessWidget {
  Place food = new Place('Cheescake', '', 'Medium');
  Place food2 = new Place('Banana pancake', '', 'Low');
  Place food3 = new Place('Cake', '', 'Expert');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfileSweet('assets/img/cheescake.jpeg', food),
          ProfileSweet('assets/img/banana_pancake.jpeg', food2),
          ProfileSweet('assets/img/grapes_cake.jpeg', food3),
        ],
      ),
    );
  }
}
