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
import 'package:eco_commerce_app/ui/widgets/toasts.dart' as toasts;

final GoogleAuth gAuth = GoogleAuth();

class GoogleButton extends StatefulWidget {
  final bool login;
  final String text;
  const GoogleButton({
    @required this.login,
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool loader = false;
  bool isError = false;
  Map<String, dynamic> res;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Consumer<CurrentUser>(
        builder: (_, currentUser, __) => Container(
          decoration: widget.login
              ? BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFEFF5FF).withOpacity(0.4),
                        blurRadius: 16,
                        offset: Offset(0, 4)),
                  ],
                  borderRadius: BorderRadius.circular(500),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(500),
                ),
          child: FlatButton(
            colorBrightness: Brightness.light,
            padding: EdgeInsets.all(0),
            shape: StadiumBorder(),
            onPressed: widget.login
                ? () {
                    gAuth.signInWithGoogle().whenComplete(() async {
                      if (!isError) {
                        try {
                          http.post(
                              Uri.parse(
                                  'https://ecocommerce.herokuapp.com/auth/local/'),
                              body: {
                                'identifier':
                                    main.prefs.getString('googleemail'),
                                'password': main.prefs.getString('googleemail')
                              }).then((http.Response response) {
                            res = (json.decode(response.body));
                            print(res);
                            if (response.statusCode == 200) {
                              toasts.successLog();
                              currentUser.getUserfromResp(res);
                              currentUser.saveUsertoSP();
                              _redirectUser();
                            } else {
                              gAuth.signOutGoogle();
                              toasts.error(
                                  res['message'][0]['messages'][0]['message']);
                            }
                          }).timeout(
                            const Duration(seconds: 30),
                            onTimeout: () {
                              gAuth.signOutGoogle();
                              toasts.timeout();
                            },
                          );
                        } on SocketException {
                          gAuth.signOutGoogle();
                          toasts.network();
                        } catch (e) {
                          print(e);
                          gAuth.signOutGoogle();
                          toasts.error(e.toString());
                        }
                      }
                    }).catchError((e) {
                      toasts.error(e.toString());
                      setState(() {
                        isError = true;
                      });
                      Future.delayed(Duration(milliseconds: 500))
                          .then((value) => Navigator.pop(context));
                    });
                  }
                : () {
                    gAuth.signInWithGoogle().whenComplete(() async {
                      if (!isError) {
                        Navigator.pushNamed(context, UserOptionalRoute,
                            arguments: [
                              main.prefs.getString('googleemail'),
                              main.prefs.getString('googlename'),
                              main.prefs.getString('googleemail')
                            ]);
                      }
                    }).catchError((e) {
                      toasts.error(e.toString());
                      setState(() {
                        isError = true;
                      });
                      Future.delayed(Duration(milliseconds: 500))
                          .then((value) => Navigator.pop(context));
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
                      child: Text(widget.text,
                          textAlign: TextAlign.center,
                          style: widget.login
                              ? Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: config.Colors().mainColor(1))
                              : Theme.of(context).textTheme.button.copyWith(
                                  color: Theme.of(context).primaryColor)),
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
