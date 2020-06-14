import 'package:eco_commerce_app/core/auth/google_auth.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Consumer<CurrentUser>(
        builder: (_, currentUser, __) => FlatButton(
          onPressed: widget.login
              ? () {
                  gAuth.signInWithGoogle().whenComplete(() async {
                    try {
                      http.post('https://ecocommerce.herokuapp.com/auth/local/',
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Color(0xFF004445),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/google.png',
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Sign in with Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
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
