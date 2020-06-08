import 'package:flutter/material.dart';

class SecondarySubmitButton extends StatelessWidget {
  final String text;
  final String boldText;
  final String routeName;
  const SecondarySubmitButton(
      {Key key, @required this.text, @required this.boldText, @required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                text + '?  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Text(
              boldText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Color(0xFF000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
