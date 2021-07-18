import 'package:flutter/material.dart';
import 'package:life_expectancy/calculate.dart';
import 'package:life_expectancy/user_data.dart';
import 'package:life_expectancy/style.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Life Expectancy',
          style: textStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Calculate(_userData).calculate().round().toString(),
                style: textStyle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Go Back',
                style: textStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
