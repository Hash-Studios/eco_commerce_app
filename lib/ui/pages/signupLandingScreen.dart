import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart';
import 'package:eco_commerce_app/ui/widgets/onboardHeading.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class SignUpLandingScreen extends StatefulWidget {
  @override
  _SignUpLandingScreenState createState() => _SignUpLandingScreenState();
}

class _SignUpLandingScreenState extends State<SignUpLandingScreen> {
  double opacity = 0;
  String heading = 'Eco-friendly';
  String caption =
      "Look deep into nature, and then you will\nunderstand everything better.";

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
      body: Container(
        decoration: BoxDecoration(
          gradient: config.Colors().purplin,
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OnboardHeading(heading: heading),
                    ),
                    Container(
                      width: width,
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: opacity,
                        curve: Curves.easeInBack,
                        child: AnimatedPadding(
                          duration: Duration(seconds: 1),
                          padding: opacity == 0
                              ? EdgeInsets.only(bottom: 0)
                              : EdgeInsets.fromLTRB(40, 10, 40, 10),
                          curve: Curves.easeInBack,
                          child: Image(
                              image: AssetImage("assets/images/splashIcon.png"),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 13,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GoogleButton(
                              login: false,
                              text: "Sign up with Google",
                            )),
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
                                  Navigator.pushNamed(context, RegisterRoute);
                                },
                                child: SizedBox(
                                  width: width * 0.75,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Text(
                                      "Create free account",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          .copyWith(
                                            color: config.Colors().mainColor(1),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SecondarySubmitButton(
                          text: 'Already have an account',
                          boldText: 'Login',
                          routeName: LoginRoute,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: width,
                  child: Hero(
                    tag: "signupprogress",
                    child: LinearProgressIndicator(
                      value: 0,
                      backgroundColor: Colors.transparent,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF96EFA6)),
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
