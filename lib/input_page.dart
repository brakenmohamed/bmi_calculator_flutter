import 'package:bmi_calculator/functions.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

//Color maleColor = inactiveColor;
//Color femaleColor = inactiveColor;
enum gender { male, female }
gender selectdGender;
int height = 180;
int weight = 60;
int age = 18;
/*void updateColor({gender gen}) {
  if (gen == gender.male) {
    if (maleColor == inactiveColor) {
      maleColor = activeColor;
      femaleColor = inactiveColor;
    } else {
      maleColor = inactiveColor;
    }
  } else {
    if (femaleColor == inactiveColor) {
      femaleColor = activeColor;
      maleColor = inactiveColor;
    } else {
      femaleColor = inactiveColor;
    }
  }
}*/

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: reCreate(
                    press: () {
                      setState(() {
                        selectdGender = gender.male;
                      });
                    },
                    childWidget: recreateColumn(
                      ico: FontAwesomeIcons.mars,
                      txt: 'MALE',
                    ),
                    colour: selectdGender == gender.male
                        ? KactiveColor
                        : KinactiveColor,
                  )),
                  Expanded(
                      child: reCreate(
                          press: () {
                            setState(() {
                              selectdGender = gender.female;
                            });
                          },
                          childWidget: recreateColumn(
                            ico: FontAwesomeIcons.venus,
                            txt: 'FEMALE',
                          ),
                          colour: selectdGender == gender.female
                              ? KactiveColor
                              : KinactiveColor))
                ],
              ),
            ),
            Expanded(
                child: reCreate(
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: KlabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KheightSize,
                      ),
                      Text(
                        'cm',
                        style: KlabelStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.2,
                      max: 250.0,
                      activeColor: KsecondColor,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      })
                ],
              ),
              colour: KactiveColor,
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: reCreate(
                    colour: KactiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: KlabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KheightSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              change: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              change: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: reCreate(
                    colour: KactiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: KlabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KheightSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              change: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              change: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            BottomButton(
                text: 'CALCULATE',
                tap: () {
                  CalculatorBrain cal =
                      CalculatorBrain(weight: weight, height: height);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        BMI: cal.calculateBMI(),
                        resultText: cal.getResult(),
                        interpretateText: cal.getInterpretation(),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final Function change;
  final IconData icon;
  RoundIconButton({@required this.icon, @required this.change});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: change,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
