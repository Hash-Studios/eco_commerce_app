import 'package:eco_commerce_app/core/auth/google_auth.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/main.dart' as main;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

final GoogleAuth gAuth = GoogleAuth();

class GoogleButton extends StatefulWidget {
  final bool login;
  const GoogleButton({
    @required this.login,
    Key key,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool loader = false;
  Map<String, dynamic> res;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Consumer<CurrentUser>(
        builder: (_, currentUser, __) => Container(
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
            onPressed: widget.login
                ? () {
                    gAuth.signInWithGoogle().whenComplete(() async {
                      try {
                        http.post(
                            'https://ecocommerce.herokuapp.com/auth/local/',
                            body: {
                              'identifier': main.prefs.getString('googleemail'),
                              'password': main.prefs.getString('googleemail')
                            }).then((http.Response response) {
                          res = (json.decode(response.body));
                          print(res);
                          if (response.statusCode == 200) {
                            Fluttertoast.showToast(
                                msg: "Login Successful!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green[400],
                                textColor: Colors.white,
                                fontSize: 16.0);
                            currentUser.getUserfromResp(res);
                            currentUser.saveUsertoSP();
                            _redirectUser();
                          } else {
                            gAuth.signOutGoogle();
                            Fluttertoast.showToast(
                                msg: res['message'][0]['messages'][0]
                                    ['message'],
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                backgroundColor: Colors.red[400],
                                fontSize: 16.0);
                          }
                        }).timeout(
                          const Duration(seconds: 30),
                          onTimeout: () {
                            gAuth.signOutGoogle();
                            Fluttertoast.showToast(
                                msg: "Connection Timeout Error!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red[400],
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                        );
                      } on SocketException {
                        gAuth.signOutGoogle();
                        Fluttertoast.showToast(
                            msg: "Network Not Connected!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red[400],
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } catch (e) {
                        print(e);
                        gAuth.signOutGoogle();
                        Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red[400],
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  }
                : () {
                    gAuth.signInWithGoogle().whenComplete(() async {
                      Navigator.pushReplacementNamed(context, UserOptionalRoute,
                          arguments: [
                            main.prefs.getString('googleemail'),
                            main.prefs.getString('googlename'),
                            main.prefs.getString('googleemail')
                          ]);
                    });
                  },
            child: SizedBox(
              width: width * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/google.png',
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Sign in with Google",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: config.Colors().mainColor(1))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _redirectUser() {
    Future.delayed(Duration(seconds: 1))
        .then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
  }
}
