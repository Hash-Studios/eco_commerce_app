import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart';
import 'package:eco_commerce_app/ui/widgets/gradientResponsiveContainer.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/orDivider.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:eco_commerce_app/ui/widgets/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/ui/widgets/toasts.dart' as toasts;

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
    return GradientResponsiveContainer(
      scaffoldLoginKey: _scaffoldLoginKey,
      height: height,
      fab: true,
      gradient: config.Colors().peachy,
      widgets: <Widget>[
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
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                        ),
                    enabled: !isLoading,
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
                    cursorColor: Color(0xFFFFFFFF),
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFF0000), width: 1),
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
                      BlacklistingTextInputFormatter.singleLineFormatter
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
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6.copyWith(
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
                        Future.delayed(Duration(seconds: 0)).then((value) {
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
                    cursorColor: Color(0xFFFFFFFF),
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(500),
                        borderSide:
                            BorderSide(color: Color(0xFFFF0000), width: 1),
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
                      BlacklistingTextInputFormatter.singleLineFormatter
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
                  toasts.validEmail();
                } else {
                  Navigator.pushNamed(context, CodeVerificationRoute,
                      arguments: ["123456", "uid", emailController.text]);
                }
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headline6.copyWith(
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
            child: SubmitButton(
              validatorSeq: true,
              isLoading: isLoading,
              width: width,
              buttonText: 'Submit',
              func: () {
                _redirectUser();
              },
            ),
          ),
        ),
        SecondarySubmitButton(
          text: 'New user',
          boldText: 'Register',
          routeName: RegisterRoute,
        )
      ],
    );
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
