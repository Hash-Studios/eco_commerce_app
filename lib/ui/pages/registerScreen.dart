import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/gradientResponsiveContainer.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:eco_commerce_app/ui/widgets/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  bool isEmailValid = false;
  bool isPassValid = false;
  bool isPassConfirmValid = false;
  bool isLoading;
  List<bool> validators = [false, false, false, false];
  double value = 0;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final FocusNode _passConfirmFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        GradientResponsiveContainer(
            scaffoldLoginKey: _scaffoldKey,
            height: height,
            fab: true,
            gradient: config.Colors().nebula,
            widgets: <Widget>[
              HeaderText(
                text: 'Sign Up',
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Form(
                key: form,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            ),
                        enabled: !isLoading,
                        controller: nameController,
                        focusNode: _nameFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, _nameFocus, _emailFocus);
                        },
                        textInputAction: TextInputAction.next,
                        cursorColor: Color(0xFFFFFFFF),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(500),
                            borderSide:
                                BorderSide(color: Color(0xFFFFFFFF), width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                          hintText: "Name",
                          hintStyle:
                              Theme.of(context).textTheme.headline6.copyWith(
                                    color: Colors.white,
                                  ),
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Icon(
                              LineAwesomeIcons.user,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        expands: false,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter
                        ],
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                          hintStyle:
                              Theme.of(context).textTheme.headline6.copyWith(
                                    color: Colors.white,
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
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPassConfirmValid = false;
                              });
                            });
                            return null;
                          } else if (text != passwordController.text) {
                            Future.delayed(Duration(seconds: 0)).then((value) {
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
                            borderSide:
                                BorderSide(color: Color(0xFFFFFFFF), width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
              Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: SubmitButton(
                  validatorSeq: isEmailValid && isPassValid,
                  isLoading: isLoading,
                  width: width,
                  buttonText: 'Submit',
                  func: () {
                    setState(() {
                      isLoading = true;
                    });
                    HapticFeedback.vibrate();
                    form.currentState.validate();
                    form.currentState.save();
                    print(
                        "name:${nameController.text},email:${emailController.text},pwd:${passwordController.text}");
                    Future.delayed(Duration(milliseconds: 500)).then((value) {
                      Navigator.pushReplacementNamed(context, UserOptionalRoute,
                          arguments: [
                            nameController.text,
                            emailController.text,
                            passwordController.text
                          ]);
                    });
                  },
                ),
              ),
            ]),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: width,
            child: Hero(
              tag: "signupprogress",
              child: LinearProgressIndicator(
                value: 0.375,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF96EFA6)),
              ),
            ),
          ),
        )
      ],
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
