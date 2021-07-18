import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/user_data.dart';
import 'package:life_expectancy/style.dart';
import 'my_widget.dart';
import 'package:life_expectancy/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String choosenGender;
  double sportsPerWeek = 0.0;
  double averageSmoke = 0.0;
  int height = 170;
  int weight = 68;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Life Expectancy',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: outlinedButtonRow('Height', height),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: outlinedButtonRow('Weight', weight),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Workouts per week', style: textStyle),
                  Text(sportsPerWeek.round().toString(), style: numberStyle),
                  Slider(
                      min: 0.0,
                      max: 7.0,
                      value: sportsPerWeek,
                      onChanged: (double newValue) {
                        setState(() {
                          sportsPerWeek = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Average smoking per day', style: textStyle),
                  Text(averageSmoke.round().toString(), style: numberStyle),
                  Slider(
                      min: 0.0,
                      max: 30.0,
                      value: averageSmoke,
                      onChanged: (double newValue) {
                        setState(() {
                          averageSmoke = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        choosenGender = 'Female';
                      });
                    },
                    color: choosenGender == 'Female'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Gender(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        choosenGender = 'Male';
                      });
                    },
                    color: choosenGender == 'Male'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Gender(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ignore: deprecated_member_use
          ButtonTheme(
              height: 50,
              // ignore: deprecated_member_use
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(UserData(
                                choosenGender: choosenGender,
                                sportsPerWeek: sportsPerWeek,
                                averageSmoke: averageSmoke,
                                height: height,
                                weight: weight))));
                  },
                  child: Text(
                    'Calculate',
                    style: textStyle,
                  ))),
        ],
      ),
    );
  }

  Row outlinedButtonRow(String text, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(text, style: textStyle),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(number.toString(), style: numberStyle),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButtonTheme(
              data: OutlinedButtonThemeData(),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (number == height)
                      height++;
                    else
                      weight++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus),
              ),
            ),
            OutlinedButtonTheme(
                data: OutlinedButtonThemeData(),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      if (number == height)
                        height--;
                      else
                        weight--;
                    });
                  },
                  child: Icon(FontAwesomeIcons.minus),
                ))
          ],
        )
      ],
    );
  }
}
