// import 'dart:io';

// import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/orDivider.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:eco_commerce_app/globals.dart' as globals;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //   with SingleTickerProviderStateMixin {
  // AnimationController controller;
  // Animation<Color> colorTween;
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
    // controller =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    // colorTween =
    //     controller.drive(new ColorTween(begin: Colors.red, end: Colors.orange));
    // controller.forward();
  }

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(
                text: 'Sign Up',
              ),
              GoogleButton(),
              OrDivider(),
              Form(
                key: form,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                      child: TextFormField(
                        enabled: !isLoading,
                        controller: nameController,
                        focusNode: _nameFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, _nameFocus, _emailFocus);
                        },
                        textInputAction: TextInputAction.next,
                        cursorColor: Color(0xFF000000),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                          hintText: "Name",
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color(0xFF000000),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Icon(
                              LineAwesomeIcons.user,
                              color: Color(0xFF000000),
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
                        cursorColor: Color(0xFF000000),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                1.5,
                                MediaQuery.of(context).size.height * 0.0525,
                                1.5,
                                0),
                            child: ClipRRect(
                              child: LinearProgressIndicator(
                                value: value,
                                backgroundColor: Colors.white,
                                // valueColor: colorTween,
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
                              borderRadius: BorderRadius.circular(500),
                            ),
                          ),
                          TextFormField(
                            enabled: !isLoading,
                            focusNode: _passFocus,
                            onChanged: (term) {
                              if (term.length >= 4 && term.length <= 12) {
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
                                  // if (value <= 0.25) {
                                  //   colorTween = controller.drive(
                                  //       new ColorTween(
                                  //           begin: Colors.white,
                                  //           end: Colors.red));
                                  //   controller.reset();
                                  //   controller.forward();
                                  // } else if (value <= 0.5) {
                                  //   colorTween = controller.drive(
                                  //       new ColorTween(
                                  //           begin: Colors.red,
                                  //           end: Colors.orange));
                                  //   controller.reset();
                                  //   controller.forward();
                                  // } else if (value <= 0.75) {
                                  //   colorTween = controller.drive(
                                  //       new ColorTween(
                                  //           begin: Colors.orange,
                                  //           end: Colors.yellow));
                                  //   controller.reset();
                                  //   controller.forward();
                                  // } else if (value <= 1) {
                                  //   colorTween = controller.drive(
                                  //       new ColorTween(
                                  //           begin: Colors.yellow,
                                  //           end: Colors.green));
                                  //   controller.reset();
                                  //   controller.forward();
                                  // }
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
                                return 'Password must be at least 4 characters,\nno more than 12 characters, and must include\nat least one upper case letter, one lower\ncase letter, and one numeric digit.';
                              }
                              Future.delayed(Duration(seconds: 0))
                                  .then((value) {
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
                                borderSide: BorderSide(
                                    color: Color(0xFF000000), width: 2),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF000000), width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF004445), width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFFFF0000), width: 2),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                      child: TextFormField(
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
                        cursorColor: Color(0xFF000000),
                        cursorRadius: Radius.circular(8),
                        cursorWidth: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFF000000), width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
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
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF000000),
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
                                color: Color(0xFF000000),
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
                child: FlatButton(
                  colorBrightness: Brightness.dark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: isEmailValid && isPassValid && isPassConfirmValid
                      ? Color(0xFF004445)
                      : Color(0xFF999999),
                  onPressed: isEmailValid &&
                          isPassValid &&
                          isPassConfirmValid &&
                          !isLoading
                      ? () {
                          setState(() {
                            isLoading = true;
                          });
                          HapticFeedback.vibrate();
                          form.currentState.validate();
                          form.currentState.save();
                          print(
                              "name:${nameController.text},email:${emailController.text},pwd:${passwordController.text}");
                          Navigator.pushReplacementNamed(
                              context, UserOptionalRoute, arguments: [
                            nameController.text,
                            emailController.text,
                            passwordController.text
                          ]);
                        }
                      : () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                text: 'Already have an account',
                boldText: 'Login',
                routeName: LoginRoute,
              )
            ],
          ),
        ),
      ),
    );
  }

//   void registerUser() async {
//     try {
//       http.post('https://ecocommerce.herokuapp.com/auth/local/register', body: {
//         'username': nameController.text,
//         'email': emailController.text,
//         'password': passwordController.text
//       }).then((http.Response response) {
//         res = (json.decode(response.body));
//         print(res);
//         if (response.statusCode == 200) {
//           _showSuccessSnackbar();
//           globals.currentUser = CurrentUser(
//             jwt: res["jwt"],
//             confirmed: res["user"]["confirmed"].toString(),
//             blocked: res["user"]["blocked"].toString(),
//             id: res["user"]["id"],
//             username: res["user"]["username"],
//             email: res["user"]["email"],
//             createdAt: res["user"]["createdAt"],
//           );
//           globals.currentUser.saveUsertoSP();
//         } else {
//           _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
//         }
//       }).timeout(
//         const Duration(seconds: 30),
//         onTimeout: () {
//           _showErrorSnackbar('Connection Timeout Error!');
//         },
//       );
//     } on SocketException {
//       _showErrorSnackbar('Network Not Connected!');
//     }
//   }

//   void _showSuccessSnackbar() {
//     setState(() {
//       isLoading = false;
//     });
//     final SnackBar snack = SnackBar(
//         content: Text(
//       'Successfully Registered!',
//       style: TextStyle(color: Colors.green),
//     ));
//     _scaffoldKey.currentState.showSnackBar(snack);
//     form.currentState.reset();
//     _redirectUser();
//   }

//   void _showErrorSnackbar(String errorMessage) {
//     setState(() {
//       isLoading = false;
//     });
//     final SnackBar snack = SnackBar(
//         content: Text(
//       errorMessage,
//       style: TextStyle(color: Colors.red),
//     ));
//     _scaffoldKey.currentState.showSnackBar(snack);
//   }

//   void _redirectUser() {
//     Future.delayed(Duration(seconds: 2))
//         .then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
//   }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
