import 'dart:async';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class CodeVerificationScreen extends StatefulWidget {
  final List<String> arguements;
  CodeVerificationScreen({this.arguements});
  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  bool isCodeValid = false;
  bool isLoading = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: config.Colors().deepSpace,
        ),
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HeaderText(
                  text: 'Enter Code',
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                      text: "Enter the code sent to ",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PinCodeTextField(
                    onChanged: (text) {
                      print(textEditingController.text.length);
                    },
                    length: 6,
                    obsecureText: false,
                    animationType: AnimationType.fade,
                    autoFocus: true,
                    textInputType: TextInputType.number,
                    errorAnimationController: errorController,
                    errorTextSpace: 30,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Poppins",
                    ),
                    autoValidate: true,
                    validator: (text) {
                      if (text == '') {
                        Future.delayed(Duration(seconds: 0)).then((value) {
                          setState(() {
                            isCodeValid = false;
                          });
                        });
                        return null;
                      } else if (!RegExp(
                        r"^[0-9]*$",
                        caseSensitive: true,
                        multiLine: false,
                      ).hasMatch(text)) {
                        Future.delayed(Duration(seconds: 0)).then((value) {
                          setState(() {
                            isCodeValid = false;
                          });
                        });
                        return 'Please enter digits only!';
                      } else if (text.length == 6) {
                        if (text != widget.arguements[0]) {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isCodeValid = false;
                            });
                          });
                          return 'Wrong Code!';
                        }
                      } else if (text.length != 6) {
                        Future.delayed(Duration(seconds: 0)).then((value) {
                          setState(() {
                            isCodeValid = false;
                          });
                        });
                      }
                      Future.delayed(Duration(seconds: 0)).then((value) {
                        setState(() {
                          if (text.length == 6) {
                            isCodeValid = true;
                          }
                        });
                      });
                      return null;
                    },
                    controller: textEditingController,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveColor: Colors.white,
                      activeColor:
                          isCodeValid || (textEditingController.text.length < 6)
                              ? Color(0xFF7EF192)
                              : Colors.red,
                      selectedColor: Color(0xFF2DC897),
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    onCompleted: (v) {
                      print("Completed");
                      if (v == widget.arguements[0]) {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(Duration(milliseconds: 300))
                            .then((value) => {
                                  Navigator.pushReplacementNamed(
                                      context, ResetPasswordRoute,
                                      arguments: widget.arguements)
                                });
                      } else {
                        errorController.add(ErrorAnimationType.shake);
                      }
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 103.68, 40, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: isCodeValid
                                ? Color(0xFF76ED92).withOpacity(0.4)
                                : Colors.transparent,
                            blurRadius: 16,
                            offset: Offset(0, 4)),
                      ],
                      gradient: isCodeValid
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
                      onPressed: isCodeValid && !isLoading
                          ? () {
                              setState(() {
                                isLoading = true;
                              });
                              HapticFeedback.vibrate();
                              if (textEditingController.text ==
                                  widget.arguements[0]) {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(Duration(milliseconds: 300))
                                    .then((value) => {
                                          Navigator.pushReplacementNamed(
                                              context, ResetPasswordRoute,
                                              arguments: widget.arguements)
                                        });
                              } else {
                                errorController.add(ErrorAnimationType.shake);
                              }
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )
                                  : Text(
                                      'Submit',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                            ],
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
    );
  }
}
