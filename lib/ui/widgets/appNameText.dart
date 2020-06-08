import 'package:flutter/material.dart';
class AppNameText extends StatelessWidget {
  const AppNameText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Eco-friendly',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 50,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
      ),
    );
  }
}