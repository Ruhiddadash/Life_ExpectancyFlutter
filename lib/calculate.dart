import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;

  Calculate(this._userData);

  double calculate() {
    double age = 60;
    double bmi;
    bmi = _userData.weight /
        (_userData.height.toDouble() * _userData.height.toDouble());
    if (bmi > 25) {
      return age - 5 - (_userData.averageSmoke / 3) + _userData.sportsPerWeek;
    } else if (bmi < 25) {
      return age + 5 - (_userData.averageSmoke / 3) + _userData.sportsPerWeek;
    } else {
      return age - 2 - (_userData.averageSmoke / 3) + _userData.sportsPerWeek;
    }
  }
}
