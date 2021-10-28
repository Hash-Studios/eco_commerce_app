import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/ui/widgets/toasts.dart' as toasts;

class ResetPasswordScreen extends StatefulWidget {
  final List<String> arguements;
  ResetPasswordScreen({this.arguements});
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  bool isLoading = false;
  bool isPassValid = false;
  bool isPassConfirmValid = false;
  List<bool> validators = [false, false, false, false];
  double value = 0;
  Map<String, dynamic> res;
  final FocusNode _passFocus = FocusNode();
  final FocusNode _passConfirmFocus = FocusNode();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
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

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: config.Colors().purplin,
        ),
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HeaderText(
                  text: 'Reset Password',
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                      text: "Enter a new Password for ",
                      children: [
                        TextSpan(
                          text: widget.arguements[2],
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              letterSpacing: 0.4),
                        ),
                      ],
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white54,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                          ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: height * 0.08),
                Form(
                  key: form,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              LinearProgressIndicator(
                                value: value,
                                backgroundColor: Colors.transparent,
                                valueColor: value <= 0.25
                                    ? AlwaysStoppedAnimation(Colors.red)
                                    : value <= 0.5
                                        ? AlwaysStoppedAnimation(Colors.orange)
                                        : value <= 0.75
                                            ? AlwaysStoppedAnimation(
                                                Colors.yellow)
                                            : value <= 1
                                                ? AlwaysStoppedAnimation(
                                                    Colors.green)
                                                : AlwaysStoppedAnimation(
                                                    Colors.white),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                enabled: !isLoading,
                                focusNode: _passFocus,
                                onChanged: (term) {
                                  if (term.length >= 6 && term.length <= 12) {
                                    validators[0] = true;
                                  } else {
                                    validators[0] = false;
                                  }
                                  if (term != term.toLowerCase()) {
                                    validators[1] = true;
                                  } else {
                                    validators[1] = false;
                                  }
                                  if (term != term.toUpperCase()) {
                                    validators[2] = true;
                                  } else {
                                    validators[2] = false;
                                  }
                                  if (RegExp(
                                    r"\d",
                                    caseSensitive: true,
                                    multiLine: false,
                                  ).hasMatch(term)) {
                                    validators[3] = true;
                                  } else {
                                    validators[3] = false;
                                  }

                                  value = 0;
                                  for (int i = 0; i < validators.length; i++) {
                                    if (validators[i] == true) {
                                      value = value + 0.25;
                                    }
                                  }
                                },
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(
                                      context, _passFocus, _passConfirmFocus);
                                },
                                textInputAction: TextInputAction.next,
                                controller: passwordController,
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
                                    r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$",
                                    caseSensitive: true,
                                    multiLine: false,
                                  ).hasMatch(text)) {
                                    Future.delayed(Duration(seconds: 0))
                                        .then((value) {
                                      setState(() {
                                        isPassValid = false;
                                      });
                                    });
                                    return 'Password must be at least 6 characters,\nno more than 12 characters, and must include\nat least one upper case letter, one lower\ncase letter, and one numeric digit.';
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
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
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
                                        color: value <= 0.25
                                            ? Colors.red
                                            : value <= 0.5
                                                ? Colors.orange
                                                : value <= 0.75
                                                    ? Colors.yellow
                                                    : value <= 1
                                                        ? Colors.green
                                                        : Colors.white,
                                        width: 1),
                                  ),
                                  errorText: null,
                                  hintText: "Password",
                                  // labelText: "Password",
                                  hintStyle: TextStyle(
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
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                              ),
                          enabled: !isLoading,
                          focusNode: _passConfirmFocus,
                          onFieldSubmitted: (term) {
                            _passConfirmFocus.unfocus();
                          },
                          textInputAction: TextInputAction.done,
                          validator: (text) {
                            if (text == '') {
                              Future.delayed(Duration(seconds: 0))
                                  .then((value) {
                                setState(() {
                                  isPassConfirmValid = false;
                                });
                              });
                              return null;
                            } else if (text != passwordController.text) {
                              Future.delayed(Duration(seconds: 0))
                                  .then((value) {
                                setState(() {
                                  isPassConfirmValid = false;
                                });
                              });
                              return 'Both Passwords must match';
                            }
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPassConfirmValid = true;
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
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
                            hintText: "Confirm Password",
                            hintStyle:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                    ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: IconButton(
                                onPressed: () {
                                  _toggleConfirm();
                                },
                                icon: Icon(
                                  _obscureTextConfirm
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
                          obscureText: _obscureTextConfirm,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<CurrentUser>(
                  builder: (_, currentUser, __) => Padding(
                    padding: EdgeInsets.fromLTRB(40, 103.68, 40, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: isPassValid && isPassConfirmValid
                                  ? Color(0xFF76ED92).withOpacity(0.4)
                                  : Colors.transparent,
                              blurRadius: 16,
                              offset: Offset(0, 4)),
                        ],
                        gradient: isPassValid && isPassConfirmValid
                            ? LinearGradient(
                                colors: [Color(0xFF96EFA6), Color(0xFF26A6B5)],
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
                        onPressed: isPassValid && !isLoading
                            ? () {
                                setState(() {
                                  isLoading = true;
                                });
                                HapticFeedback.vibrate();
                                resetPassword(currentUser);
                              }
                            : () {},
                        child: SizedBox(
                          width: width * 0.75,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
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
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                              ],
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
      ),
    );
  }

  void resetPassword(CurrentUser currentUser) async {
    try {
      http.put(
          Uri.parse(
              'http://ecocommerce.herokuapp.com/users/${widget.arguements[1]}'),
          body: {
            'password': passwordController.text
          }).then((http.Response response) {
        res = (json.decode(response.body));
        print(res);
        if (response.statusCode == 200) {
          toasts.successPassReset();
          loginUser(currentUser);
        } else {
          toasts.error(res['message'][0]['messages'][0]['message']);
          form.currentState.reset();
          if (this.mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      }).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          toasts.timeout();
          form.currentState.reset();
          if (this.mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
      );
    } on SocketException {
      toasts.network();
      form.currentState.reset();
      if (this.mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      toasts.error(e.toString());
      if (this.mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void loginUser(CurrentUser currentUser) async {
    try {
      http.post(Uri.parse('https://ecocommerce.herokuapp.com/auth/local/'),
          body: {
            'identifier': widget.arguements[2],
            'password': passwordController.text
          }).then((http.Response response) {
        res = (json.decode(response.body));
        print(res);
        if (response.statusCode == 200) {
          toasts.successLog();
          currentUser.getUserfromResp(res);
          currentUser.saveUsertoSP();
          _redirectUser();
        } else {
          toasts.error(res['message'][0]['messages'][0]['message']);
          form.currentState.reset();
        }
        setState(() {
          isLoading = false;
        });
      }).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          toasts.timeout();
          form.currentState.reset();
          setState(() {
            isLoading = false;
          });
        },
      );
    } on SocketException {
      toasts.network();
      form.currentState.reset();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      toasts.error(e.toString());
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
