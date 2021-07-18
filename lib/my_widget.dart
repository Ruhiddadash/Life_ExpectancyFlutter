import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final String text;
  final IconData icon;
  Gender({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;
  MyContainer({this.color = Colors.white, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
