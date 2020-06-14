import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/pages/onboardScreen3.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:line_awesome_icons/line_awesome_icons.dart';

class OnboardScreen1 extends StatefulWidget {
  @override
  _OnboardScreen1State createState() => _OnboardScreen1State();
}

class _OnboardScreen1State extends State<OnboardScreen1> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA1A3FF), Color(0xFF6D63EF)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: width,
                child: Image(
                    image: AssetImage("assets/images/onboard1.png"),
                    fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Eco-friendly',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Text(
                "Look deep into nature, and then you will\nunderstand everything better.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF1F1F1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Transform.rotate(
                        angle: math.pi / 4.0,
                        child: Container(
                          width: 10,
                          height: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Transform.rotate(
                        angle: math.pi / 4.0,
                        child: Container(
                          width: 9,
                          height: 9,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Transform.rotate(
                        angle: math.pi / 4.0,
                        child: Container(
                          width: 9,
                          height: 9,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFEFF5FF).withOpacity(0.4),
                          blurRadius: 16,
                          offset: Offset(0, 4)),
                    ],
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: FlatButton(
                    colorBrightness: Brightness.light,
                    padding: EdgeInsets.all(0),
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.pushNamed(context, OnboardRoute2);
                    },
                    child: SizedBox(
                      width: width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
