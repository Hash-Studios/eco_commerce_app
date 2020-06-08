import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF000000),
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
