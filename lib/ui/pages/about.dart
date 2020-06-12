import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Container(
            child: Text('Terms and Conditions',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(31.0),
          child: Container(
            child: Text('Return Policy',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
          child: Container(
            height: 33,
            width: 153,
            child: Text('lorem ipsum',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(31.0),
          child: Container(
            height: 33,
            width: 153,
            child: Text('Privacy Policy',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
          child: Container(
            height: 33,
            width: 153,
            child: Text('lorem ipsum',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.normal,
                )),
          ),
        )
      ]),
    );
  }
}
