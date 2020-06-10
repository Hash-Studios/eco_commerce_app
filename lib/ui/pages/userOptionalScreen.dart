import 'dart:convert';
import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/secondarySubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:eco_commerce_app/globals.dart' as globals;

class UserOptionalScreen extends StatefulWidget {
  @override
  _UserOptionalScreenState createState() => _UserOptionalScreenState();
}

class _UserOptionalScreenState extends State<UserOptionalScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldOptionalKey,
      body: SingleChildScrollView(
        child: Container(
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
                        controller: orgController,
                        focusNode: _orgFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, _orgFocus, _emailFocus);
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
                                BorderSide(color: Color(0xFF044455), width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFFFF0000), width: 2),
                          ),
                          errorText: null,
                          hintText: "Organisation Name",
                          labelText: "Organisation Name",
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
                        controller: emailController,
                        focusNode: _emailFocus,
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(context, _emailFocus, _phoneFocus);
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
                          hintText: "Corporate Email Address",
                          labelText: "Corporate Email Address",
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
                        validator: (text) {
                          if (text == '') {
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPhoneValid = false;
                              });
                            });
                            return null;
                          } else if (text.length != 10) {
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                isPhoneValid = false;
                              });
                            });
                            return 'Please enter a valid phone number';
                          }
                          Future.delayed(Duration(seconds: 0)).then((value) {
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
                                BorderSide(color: Color(0xFF044455), width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Color(0xFFFF0000), width: 2),
                          ),
                          errorText: null,
                          hintText: "Phone Number",
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                            color: Color(0xFF000000),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Icon(
                              LineAwesomeIcons.phone,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        expands: false,
                        inputFormatters: [
                          BlacklistingTextInputFormatter.singleLineFormatter
                        ],
                        keyboardType: TextInputType.phone,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: FlatButton(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       onPressed: () {
              //         HapticFeedback.vibrate();
              //         print("email:${emailController.text}");
              //         forgotPassword();
              //       },
              //       child: Padding(
              //         padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //         child: Text('Forgot Password'),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 103.68, 40, 0),
                child: FlatButton(
                  colorBrightness: Brightness.dark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: isEmailValid ? Color(0xFF004445) : Color(0xFF999999),
                  onPressed:
                      // sEmailValid && isPassValid && !isLoading
                      //     ? () {
                      //         setState(() {
                      //           isLoading = true;
                      //         });
                      //         HapticFeedback.vibrate();
                      //         formOptional.currentState.validate();
                      //         formOptional.currentState.save();
                      //         print(
                      //             "email:${emailController.text},pwd:${passwordController.text}");
                      //         loginUser();
                      //       }
                      //     :
                      () {
                    Navigator.pushReplacementNamed(context, FeedRoute);
                  },
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
              // SecondarySubmitButton(
              //   text: 'New user',
              //   boldText: 'Register',
              //   routeName: RegisterRoute,
              // )
            ],
          ),
        ),
      ),
    );
  }

  // void forgotPassword() async {
  //   http.post('http://192.168.1.10:1337/auth/forgot-password',
  //       body: {'email': emailController.text}).then((http.Response response) {
  //     res = (json.decode(response.body));
  //     print(res);
  //     if (response.statusCode == 200)
  //       _showSuccessSnackbarFP();
  //     else {
  //       _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
  //     }
  //   });
  // }

  void loginUser() async {
    http.post('http://192.168.1.10:1337/auth/local/', body: {
      'identifier': emailController.text,
      // 'password': passwordController.text
    }).then((http.Response response) {
      res = (json.decode(response.body));
      globals.currentUser = CurrentUser(
        jwt: res["jwt"],
        confirmed: res["user"]["confirmed"].toString(),
        blocked: res["user"]["blocked"].toString(),
        id: res["user"]["id"],
        username: res["user"]["username"],
        email: res["user"]["email"],
        createdAt: res["user"]["createdAt"],
      );
      globals.currentUser.saveUsertoSP();
      print(res);
      if (response.statusCode == 200)
        _showSuccessSnackbar();
      else {
        _showErrorSnackbar(res['message'][0]['messages'][0]['message']);
      }
    });
  }

  void _showSuccessSnackbarFP() {
    final SnackBar snack = SnackBar(
        content: Text(
      'Verification code sent to ${emailController.text}',
      style: TextStyle(color: Colors.green),
    ));
    _scaffoldOptionalKey.currentState.showSnackBar(snack);
    formOptional.currentState.reset();
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
    _scaffoldOptionalKey.currentState.showSnackBar(snack);
    formOptional.currentState.reset();
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
    _scaffoldOptionalKey.currentState.showSnackBar(snack);
  }

  void _redirectUser() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, FeedRoute));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
