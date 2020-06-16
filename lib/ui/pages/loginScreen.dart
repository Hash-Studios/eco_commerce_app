import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/orDivider.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eco_commerce_app/core/auth/mail.dart' as mail;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool isEmailValid = false;
  bool isPassValid = false;
  bool isLoading;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldLoginKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> res;
  List<dynamic> res2;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldLoginKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: config.Colors().peachy,
            ),
            child: SizedBox(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderText(
                      text: 'Login',
                    ),
                    GoogleButton(
                      login: true,
                      text: "Sign in with Google",
                    ),
                    OrDivider(),
                    Form(
                      key: formLogin,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                // gradient: LinearGradient(
                                //   colors: [
                                //     isEmailValid
                                //         ? Color(0xBB96EFA6)
                                //         : Color(0x00FF7777),
                                //     isEmailValid
                                //         ? Color(0xBB26A6B5)
                                //         : Color(0x00FF3333)
                                //   ],
                                //   begin: Alignment.topRight,
                                //   end: Alignment.bottomLeft,
                                // ),
                              ),
                              child: TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                enabled: !isLoading,
                                controller: emailController,
                                focusNode: _emailFocus,
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(
                                      context, _emailFocus, _passFocus);
                                },
                                textInputAction: TextInputAction.next,
                                validator: (text) {
                                  if (text == '') {
                                    Future.delayed(Duration(seconds: 0))
                                        .then((value) {
                                      setState(() {
                                        isEmailValid = false;
                                      });
                                    });
                                    return null;
                                  } else if (!RegExp(
                                    r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$",
                                    caseSensitive: false,
                                    multiLine: false,
                                  ).hasMatch(text)) {
                                    Future.delayed(Duration(seconds: 0))
                                        .then((value) {
                                      setState(() {
                                        isEmailValid = false;
                                      });
                                    });
                                    return 'Please enter a valid email address';
                                  }
                                  Future.delayed(Duration(seconds: 0))
                                      .then((value) {
                                    setState(() {
                                      isEmailValid = true;
                                    });
                                  });
                                  return null;
                                },
                                cursorColor: Color(0xFFFFFFFF),
                                cursorRadius: Radius.circular(8),
                                cursorWidth: 4,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFF0000), width: 1),
                                  ),
                                  errorText: null,
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  labelText: "Email Address",
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Icon(
                                      LineAwesomeIcons.at,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                expands: false,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter
                                ],
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                // gradient: LinearGradient(
                                //   colors: [
                                //     isPassValid
                                //         ? Color(0xBB96EFA6)
                                //         : Color(0x00FF7777),
                                //     isPassValid
                                //         ? Color(0xBB26A6B5)
                                //         : Color(0x00FF3333)
                                //   ],
                                //   begin: Alignment.topRight,
                                //   end: Alignment.bottomLeft,
                                // ),
                              ),
                              child: TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                enabled: !isLoading,
                                controller: passwordController,
                                focusNode: _passFocus,
                                onFieldSubmitted: (term) {
                                  _passFocus.unfocus();
                                },
                                textInputAction: TextInputAction.done,
                                validator: (text) {
                                  if (text == '') {
                                    Future.delayed(Duration(seconds: 0))
                                        .then((value) {
                                      setState(() {
                                        isPassValid = false;
                                      });
                                    });
                                    return null;
                                  } else if (!RegExp(
                                    r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}$",
                                    caseSensitive: true,
                                    multiLine: false,
                                  ).hasMatch(text)) {
                                    Future.delayed(Duration(seconds: 0))
                                        .then((value) {
                                      setState(() {
                                        isPassValid = false;
                                      });
                                    });
                                    return null;
                                  }
                                  Future.delayed(Duration(seconds: 0))
                                      .then((value) {
                                    setState(() {
                                      isPassValid = true;
                                    });
                                  });
                                  return null;
                                },
                                cursorColor: Color(0xFFFFFFFF),
                                cursorRadius: Radius.circular(8),
                                cursorWidth: 4,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFFFFF), width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(500),
                                    borderSide: BorderSide(
                                        color: Color(0xFFFF0000), width: 1),
                                  ),
                                  errorText: null,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 17),
                                    child: IconButton(
                                      onPressed: () {
                                        _toggle();
                                      },
                                      icon: Icon(
                                        _obscureText
                                            ? LineAwesomeIcons.eye
                                            : LineAwesomeIcons.eye_slash,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                                expands: false,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter
                                ],
                                obscureText: _obscureText,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(500)),
                          onPressed: () {
                            HapticFeedback.vibrate();
                            if (emailController.text == "" || !isEmailValid) {
                              Fluttertoast.showToast(
                                  msg: "Please enter valid email address!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.red[400],
                                  fontSize: 16.0);
                              print("email:${emailController.text}");
                            } else {
                              forgotPassword();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              'Forgot Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white70,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Consumer<CurrentUser>(
                      builder: (_, currentUser, __) => Padding(
                        padding: EdgeInsets.fromLTRB(40, 103.68, 40, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: isEmailValid && isPassValid
                                      ? Color(0xFF76ED92).withOpacity(0.4)
                                      : Colors.transparent,
                                  blurRadius: 16,
                                  offset: Offset(0, 4)),
                            ],
                            gradient: isEmailValid && isPassValid
                                ? LinearGradient(
                                    colors: [
                                      Color(0xFF96EFA6),
                                      Color(0xFF26A6B5)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  )
                                : LinearGradient(
                                    colors: [
                                      Color(0xFFFFFFFF).withOpacity(0.2),
                                      Color(0xFFFFFFFF).withOpacity(0.2)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            colorBrightness: Brightness.dark,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500)),
                            color: Colors.transparent,
                            onPressed: isEmailValid && isPassValid && !isLoading
                                ? () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    HapticFeedback.vibrate();
                                    formLogin.currentState.validate();
                                    formLogin.currentState.save();
                                    print(
                                        "email:${emailController.text},pwd:${passwordController.text}");
                                    loginUser(currentUser);
                                  }
                                : () {},
                            child: SizedBox(
                              width: width * 0.75,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    isLoading
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : Text(
                                            'Submit',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SecondarySubmitButton(
                      text: 'New user',
                      boldText: 'Register',
                      routeName: RegisterRoute,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              child: Icon(
                LineAwesomeIcons.close,
                color: Theme.of(context).primaryColor,
              ),
              elevation: 0,
              highlightElevation: 0,
              disabledElevation: 0,
              focusElevation: 0,
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  void forgotPassword() async {
    http
        .get(
      'http://ecocommerce.herokuapp.com/users',
    )
        .then((http.Response response) {
      res2 = (json.decode(response.body));
      bool userFound = false;
      var userId;
      if (response.statusCode == 200) {
        for (int u = 0; u < res2.length; u++) {
          if (emailController.text == res2[u]["email"]) {
            Fluttertoast.showToast(
                msg: "Reset Password code sent to ${emailController.text}",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                backgroundColor: Colors.green[400],
                fontSize: 16.0);
            userId = res2[u]["id"];
            userFound = true;
            break;
          }
        }
        if (!userFound) {
          Fluttertoast.showToast(
              msg: "Sorry no user found with this email address!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.red[400],
              fontSize: 16.0);
        } else {
          Random random = new Random();
          int code = random.nextInt(899999) + 100000;
          mail.sendForgotPasswordMail(emailController.text, code.toString());
          Navigator.pushReplacementNamed(context, CodeVerificationRoute,
              arguments: [
                code.toString(),
                userId.toString(),
                emailController.text
              ]);
        }
      } else {
        Fluttertoast.showToast(
            msg: json.decode(response.body)['message'][0]['messages'][0]
                ['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red[400],
            fontSize: 16.0);
        formLogin.currentState.reset();
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  void loginUser(CurrentUser currentUser) async {
    try {
      http.post('https://ecocommerce.herokuapp.com/auth/local/', body: {
        'identifier': emailController.text,
        'password': passwordController.text
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
          Fluttertoast.showToast(
              msg: res['message'][0]['messages'][0]['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.red[400],
              fontSize: 16.0);
          formLogin.currentState.reset();
        }
        setState(() {
          isLoading = false;
        });
      }).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          Fluttertoast.showToast(
              msg: "Connection Timeout Error!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red[400],
              textColor: Colors.white,
              fontSize: 16.0);
          formLogin.currentState.reset();
          setState(() {
            isLoading = false;
          });
        },
      );
    } on SocketException {
      Fluttertoast.showToast(
          msg: "Network Not Connected!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0);
      formLogin.currentState.reset();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _redirectUser() {
    Navigator.pushReplacementNamed(context, HomeRoute);
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
