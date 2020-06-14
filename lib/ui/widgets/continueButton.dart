import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginRoute);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Color(0xFF004445),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Image.asset(
              'assets/icons/arrow.png',
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
