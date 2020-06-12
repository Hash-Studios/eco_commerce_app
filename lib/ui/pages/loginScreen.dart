import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/orDivider.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:eco_commerce_app/globals.dart' as globals;

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
    return Scaffold(
      key: _scaffoldLoginKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(
                text: 'Login',
              ),
              GoogleButton(),
              OrDivider(),
              Form(
                key: formLogin,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                      child: TextFormField(
                        controller: emailController,
                        focusNode: _emailFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, _emailFocus, _passFocus);
                        },
                        textInputAction: TextInputAction.next,
                        validator: (text) {
                          if (text == '') {
                            Future.delayed(Duration(seconds: 0)).then((value) {
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
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isEmailValid = false;
                              });
                            });
                            return 'Please enter a valid email address';
                          }
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isEmailValid = true;
                            });
                          });
                          return null;
                        },
                        cursorColor: Color(0xFF000000),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF004445), width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFFFF0000), width: 2),
                          ),
                          errorText: null,
                          hintText: "Email Address",
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                            color: Color(0xFF000000),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Icon(
                              LineAwesomeIcons.at,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        expands: false,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter
                        ],
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                      child: TextFormField(
                        controller: passwordController,
                        focusNode: _passFocus,
                        onFieldSubmitted: (term) {
                          _passFocus.unfocus();
                        },
                        textInputAction: TextInputAction.done,
                        validator: (text) {
                          if (text == '') {
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPassValid = false;
                              });
                            });
                            return null;
                          } else if (!RegExp(
                            r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}$",
                            caseSensitive: false,
                            multiLine: false,
                          ).hasMatch(text)) {
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPassValid = false;
                              });
                            });
                            return null;
                          }
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isPassValid = true;
                            });
                          });
                          return null;
                        },
                        cursorColor: Color(0xFF000000),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF004445), width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFFFF0000), width: 2),
                          ),
                          errorText: null,
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF000000),
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
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        expands: false,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter
                        ],
                        obscureText: _obscureText,
                        keyboardType: TextInputType.emailAddress,
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
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      print("email:${emailController.text}");
                      forgotPassword();
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text('Forgot Password'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 103.68, 40, 0),
                child: FlatButton(
                  colorBrightness: Brightness.dark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: isEmailValid && isPassValid
                      ? Color(0xFF004445)
                      : Color(0xFF999999),
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
                          loginUser();
                        }
                      : () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Submit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                      ],
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
    );
  }

  void forgotPassword() async {
    http.post('https://ecocommerce.herokuapp.com/auth/forgot-password',
        body: {'email': emailController.text}).then((http.Response response) {
      res = (json.decode(response.body));
      print(res);
      if (response.statusCode == 200)
        _showSuccessSnackbarFP();
      else {
        _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
      }
    });
  }

  void loginUser() async {
    try {
      http.post('https://ecocommerce.herokuapp.com/auth/local/', body: {
        'identifier': emailController.text,
        'password': passwordController.text
      }).then((http.Response response) {
        res = (json.decode(response.body));
        print(res);
        if (response.statusCode == 200) {
          _showSuccessSnackbar();
          globals.currentUser = CurrentUser(
            jwt: res["jwt"],
            confirmed: res["user"]["confirmed"].toString(),
            blocked: res["user"]["blocked"].toString(),
            id: res["user"]["id"],
            username: res["user"]["username"],
            email: res["user"]["email"],
            organisation: res["user"]["organisation"],
            orgemail: res["user"]["orgemail"],
            phone: res["user"]["phone"],
            createdAt: res["user"]["createdAt"],
          );
          globals.currentUser.saveUsertoSP();
        } else {
          _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
        }
      }).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          _showErrorSnackbar('Connection Timeout Error!');
        },
      );
    } on SocketException {
      _showErrorSnackbar('Network Not Connected!');
    }
  }

  void _showSuccessSnackbarFP() {
    final SnackBar snack = SnackBar(
        content: Text(
      'Verification code sent to ${emailController.text}',
      style: TextStyle(color: Colors.green),
    ));
    _scaffoldLoginKey.currentState.showSnackBar(snack);
    formLogin.currentState.reset();
  }

  void _showSuccessSnackbar() {
    setState(() {
      isLoading = false;
    });
    final SnackBar snack = SnackBar(
        content: Text(
      'Login Successful!',
      style: TextStyle(color: Colors.green),
    ));
    _scaffoldLoginKey.currentState.showSnackBar(snack);
    formLogin.currentState.reset();
    _redirectUser();
  }

  void _showErrorSnackbar(String errorMessage) {
    setState(() {
      isLoading = false;
    });
    final SnackBar snack = SnackBar(
        content: Text(
      errorMessage,
      style: TextStyle(color: Colors.red),
    ));
    _scaffoldLoginKey.currentState.showSnackBar(snack);
  }

  void _redirectUser() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
