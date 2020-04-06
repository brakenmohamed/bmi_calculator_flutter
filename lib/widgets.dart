import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class recreateColumn extends StatelessWidget {
  recreateColumn({this.ico, this.txt});
  final IconData ico;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ico,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          txt,
          style: KlabelStyle,
        )
      ],
    );
  }
}

class reCreate extends StatelessWidget {
  final Color colour;
  final Widget childWidget;
  final Function press;
  reCreate({@required this.colour, this.childWidget, this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

//Function gesture;
class BottomButton extends StatelessWidget {
  final String text;
  final Function tap;
  BottomButton({@required this.text, @required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: 75,
        decoration: BoxDecoration(
            color: KsecondColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0), topLeft: Radius.circular(15))),
      ),
    );
  }
}
