import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:bmi_calculator/functions.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.BMI,
      @required this.resultText,
      @required this.interpretateText});
  final String BMI;
  final String resultText;
  final String interpretateText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: KresultText,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: reCreate(
                colour: KactiveColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: KstyleresultText,
                    ),
                    Text(
                      BMI,
                      style: KBMIstyle,
                    ),
                    Text(
                      interpretateText,
                      style: KpTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomButton(
              text: 'RE-CALCULATE',
              tap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
