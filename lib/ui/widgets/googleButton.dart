import 'package:eco_commerce_app/core/auth/google_auth.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/main.dart' as main;

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
                            // _showSuccessSnackbar();
                            currentUser.getUserfromResp(res);
                            currentUser.saveUsertoSP();
                            _redirectUser();
                          } else {
                            gAuth.signOutGoogle();
                            // _showErrorSnackbar(
                            //     res['message'][0]['messages'][0]['message']);
                          }
                        }).timeout(
                          const Duration(seconds: 30),
                          onTimeout: () {
                            gAuth.signOutGoogle();
                            // _showErrorSnackbar('Connection Timeout Error!');
                          },
                        );
                      } on SocketException {
                        gAuth.signOutGoogle();
                        // _showErrorSnackbar('Network Not Connected!');
                      } catch (e) {
                        print(e);
                        gAuth.signOutGoogle();
                        // _showErrorSnackbar(e.toString());
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
                      child: Text(
                        "Sign in with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C1C),
                        ),
                      ),
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
