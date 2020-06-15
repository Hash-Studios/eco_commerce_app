import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:line_awesome_icons/line_awesome_icons.dart';

class OnboardScreen2 extends StatefulWidget {
  @override
  _OnboardScreen2State createState() => _OnboardScreen2State();
}

class _OnboardScreen2State extends State<OnboardScreen2> {
  double opacity = 0;

  void setOpacity() {
    setState(() {
      opacity = 0;
    });
    Future.delayed(Duration(seconds: 0)).then((value) {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setOpacity();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            left: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              child: Icon(LineAwesomeIcons.arrow_left),
              elevation: 0,
              highlightElevation: 0,
              disabledElevation: 0,
              focusElevation: 0,
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFB382), Color(0xFFF07590)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text(
                  "One of the first conditions of happiness\nlink between man.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF1F1F1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 95.0),
                child: Container(
                  width: width,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity,
                    curve: Curves.easeInBack,
                    child: AnimatedPadding(
                      duration: Duration(seconds: 1),
                      padding: opacity == 0
                          ? EdgeInsets.only(bottom: 20)
                          : EdgeInsets.fromLTRB(20, 50, 20, 20),
                      curve: Curves.easeInBack,
                      child: Image(
                          image: AssetImage("assets/images/onboard2.png"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'Onboard',
                transitionOnUserGestures: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                    ],
                  ),
                ),
              ),
              Hero(
                tag: 'OnboardButton',
                transitionOnUserGestures: true,
                child: Padding(
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
                        Navigator.pushNamed(context, OnboardRoute3);
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
