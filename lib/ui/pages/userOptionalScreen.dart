import 'dart:convert';
import 'dart:io';
import 'package:eco_commerce_app/core/auth/google_auth.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart' as googleButton;
import 'package:eco_commerce_app/core/auth/mail.dart' as mail;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

final GoogleAuth gAuth = googleButton.gAuth;

class UserOptionalScreen extends StatefulWidget {
  final List<String> arguements;
  UserOptionalScreen({this.arguements});

  @override
  _UserOptionalScreenState createState() => _UserOptionalScreenState();
}

class _UserOptionalScreenState extends State<UserOptionalScreen> {
  String name;
  String email;
  String password;
  bool isEmailValid = false;
  bool isPhoneValid = false;
  bool isLoading;
  final FocusNode _orgFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  TextEditingController orgController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formOptional = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldOptionalKey =
      GlobalKey<ScaffoldState>();
  Map<String, dynamic> res;
  @override
  void initState() {
    isLoading = false;
    super.initState();
    name = widget.arguements[0];
    email = widget.arguements[1];
    password = widget.arguements[2];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldOptionalKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: config.Colors().disco,
            ),
            child: SizedBox(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderText(
                      text: 'More Info',
                    ),
                    SizedBox(height: height * 0.1),
                    Form(
                      key: formOptional,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                            child: TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                              enabled: !isLoading,
                              controller: orgController,
                              focusNode: _orgFocus,
                              onFieldSubmitted: (term) {
                                _fieldFocusChange(
                                    context, _orgFocus, _emailFocus);
                              },
                              textInputAction: TextInputAction.next,
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
                                hintText: "Organisation Name",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                labelText: "Organisation Name",
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
                                BlacklistingTextInputFormatter
                                    .singleLineFormatter
                              ],
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
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
                                    context, _emailFocus, _phoneFocus);
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
                                hintText: "Corporate Email Address",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                labelText: "Corporate Email Address",
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15.6, 40, 15.6),
                            child: TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                              enabled: !isLoading,
                              validator: (text) {
                                if (text == '') {
                                  Future.delayed(Duration(seconds: 0))
                                      .then((value) {
                                    setState(() {
                                      isPhoneValid = false;
                                    });
                                  });
                                  return null;
                                } else if (!RegExp(
                                        r"^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$")
                                    .hasMatch(text)) {
                                  Future.delayed(Duration(seconds: 0))
                                      .then((value) {
                                    setState(() {
                                      isPhoneValid = false;
                                    });
                                  });
                                  return 'Please enter a valid phone number';
                                }
                                Future.delayed(Duration(seconds: 0))
                                    .then((value) {
                                  setState(() {
                                    isPhoneValid = true;
                                  });
                                });
                                return null;
                              },
                              controller: phoneController,
                              focusNode: _phoneFocus,
                              onFieldSubmitted: (term) {
                                _phoneFocus.unfocus();
                              },
                              textInputAction: TextInputAction.done,
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
                                hintText: "Phone Number",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Icon(
                                    LineAwesomeIcons.phone,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              expands: false,
                              inputFormatters: [
                                BlacklistingTextInputFormatter
                                    .singleLineFormatter
                              ],
                              keyboardType: TextInputType.phone,
                              textCapitalization: TextCapitalization.words,
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
                                  color: isEmailValid && isPhoneValid
                                      ? Color(0xFF76ED92).withOpacity(0.4)
                                      : Colors.transparent,
                                  blurRadius: 16,
                                  offset: Offset(0, 4)),
                            ],
                            gradient: isEmailValid && isPhoneValid
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
                            onPressed:
                                isEmailValid && !isLoading && isPhoneValid
                                    ? () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        HapticFeedback.vibrate();
                                        formOptional.currentState.validate();
                                        formOptional.currentState.save();
                                        print(
                                            "corporate_email:${emailController.text},org_name:${orgController.text}");
                                        registerUser(currentUser);
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

  void registerUser(CurrentUser currentUser) async {
    try {
      http.post('https://ecocommerce.herokuapp.com/auth/local/register', body: {
        'username': name,
        'email': email,
        'password': password,
        'orgemail': emailController.text,
        'organisation': orgController.text,
        'phone': phoneController.text
      }).then((http.Response response) {
        res = (json.decode(response.body));
        print(res);
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: "Successfully Registered!",
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
              msg: res['message'][0]['messages'][0]['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.red[400],
              fontSize: 16.0);
          formOptional.currentState.reset();
          setState(() {
            isLoading = false;
          });
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
          formOptional.currentState.reset();
          setState(() {
            isLoading = false;
          });
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
      formOptional.currentState.reset();
      setState(() {
        isLoading = false;
      });
    }
  }

  void _redirectUser() {
    mail.sendUserConfirmMail(email, name);
    Navigator.pushReplacementNamed(context, HomeRoute);
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
