import 'package:fire_sweet_app/widgets/photoUpload.dart';
import 'package:flutter/material.dart';

class ButtonOrange extends StatefulWidget {
/*   String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;
 */
/*   ButtonOrange(
      {Key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});
 */
  @override
  State<StatefulWidget> createState() {
    return _ButtonOrange();
  }
}

class _ButtonOrange extends State<ButtonOrange> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 45.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
/*             Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return PhotoUpload();
            })); */
          },
        child: Icon(Icons.add_a_photo)
        )],
    )
    );
  }
}


  /*   return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                colors: [
                  Colors.orange.shade400,
                  Colors.orange.shade300,
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.2),
                stops: [0.0, 0.7],
                tileMode: TileMode.clamp)),
        child: Center(
            child: Text(widget.text,
                style: TextStyle(
                    fontSize: 18.0, fontFamily: "Lato", color: Colors.white))),
      ),
    );
  }
}
 */