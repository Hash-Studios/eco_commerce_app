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
          child: Text(text, style: Theme.of(context).textTheme.headline1),
        ),
      ],
    );
  }
}
