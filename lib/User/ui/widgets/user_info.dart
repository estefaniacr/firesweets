import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  String pathImg;
  String name;
  String email;

  UserInformation(this.pathImg, this.name, this.email);

  @override
  Widget build(BuildContext context) {
    final userImg = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImg))),
    );

    final UserInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontFamily: 'Lato',
                ))),
        Text(email,
            style: TextStyle(
                fontSize: 17.0, color: Colors.purple, fontFamily: 'Lato')),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Row(
        children: [userImg, UserInformation],
      ),
    );
  }
}
