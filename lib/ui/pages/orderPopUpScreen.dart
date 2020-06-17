import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/gradientResponsiveContainer.dart';
import 'package:eco_commerce_app/ui/widgets/headerText.dart';
import 'package:eco_commerce_app/ui/widgets/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/core/auth/mail.dart' as mail;
import 'package:eco_commerce_app/main.dart' as main;
import 'package:eco_commerce_app/ui/widgets/toasts.dart' as toasts;
import 'dart:async';

class OrderPopUp extends StatefulWidget {
  final List<Product> arguements;
  OrderPopUp({this.arguements});

  @override
  _OrderPopUpState createState() => _OrderPopUpState();
}

class _OrderPopUpState extends State<OrderPopUp> {
  final GlobalKey<ScaffoldState> scaffoldOrderKey = GlobalKey<ScaffoldState>();
  Product product;
  bool isQuantityValid;
  bool isPriceValid;
  bool isDateValid;
  bool isTNCValid;
  TextEditingController qtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  final FocusNode _qtyFocus = FocusNode();
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _msgFocus = FocusNode();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    isQuantityValid = false;
    isPriceValid = false;
    isDateValid = false;
    isTNCValid = false;
    product = widget.arguements[0];
    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toLocal().toString().split(" ")[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GradientResponsiveContainer(
        scaffoldLoginKey: scaffoldOrderKey,
        gradient: config.Colors().easyMed,
        height: height,
        widgets: [
          HeaderText(text: "Order"),
          Form(
            autovalidate: true,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                      focusNode: _qtyFocus,
                      controller: qtyController,
                      textInputAction: TextInputAction.next,
                      cursorColor: Color(0xFFFFFFFF),
                      cursorRadius: Radius.circular(8),
                      cursorWidth: 1.8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(500),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        hintText: "Quantity",
                        hintStyle:
                            Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.white,
                                ),
                        labelText: "Quantity",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (tex) {
                        if (tex == '') {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isQuantityValid = false;
                            });
                          });
                          return null;
                        } else if (!RegExp(
                          r"^[0-9]*$",
                          caseSensitive: true,
                          multiLine: false,
                        ).hasMatch(tex)) {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isQuantityValid = false;
                            });
                          });
                          return 'Please enter a valid quantity';
                        } else if (tex == "0") {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isQuantityValid = false;
                            });
                          });
                          return 'Please enter a valid quantity';
                        }
                        Future.delayed(Duration(seconds: 0)).then((value) {
                          setState(() {
                            if (tex.length != 6) {
                              isQuantityValid = true;
                            }
                          });
                        });
                        return null;
                      },
                      onSaved: (String value) {
                        //  _name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                      controller: priceController,
                      focusNode: _priceFocus,
                      textInputAction: TextInputAction.next,
                      cursorColor: Color(0xFFFFFFFF),
                      cursorRadius: Radius.circular(8),
                      cursorWidth: 1.8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(500),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        hintText: "Offerable Price",
                        hintStyle:
                            Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.white,
                                ),
                        labelText: "Offerable Price",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (tex) {
                        if (tex == '') {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isPriceValid = false;
                            });
                          });
                          return null;
                        } else if (!RegExp(
                          r"^[0-9]*$",
                          caseSensitive: true,
                          multiLine: false,
                        ).hasMatch(tex)) {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isPriceValid = false;
                            });
                          });
                          return 'Please enter a valid price';
                        } else if (tex == "0") {
                          Future.delayed(Duration(seconds: 0)).then((value) {
                            setState(() {
                              isPriceValid = false;
                            });
                          });
                          return 'Please enter a valid price';
                        }
                        Future.delayed(Duration(seconds: 0)).then((value) {
                          setState(() {
                            if (tex.length != 6) {
                              isPriceValid = true;
                            }
                          });
                        });
                        return null;
                      },
                      onSaved: (String value) {
                        //   _name = value;
                      },
                    ),
                  ),
                  // ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                    child: Stack(
                      children: <Widget>[
                        TextFormField(
                          enabled: false,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                              ),
                          controller: dateController,
                          focusNode: _dateFocus,
                          textInputAction: TextInputAction.next,
                          cursorColor: Color(0xFFFFFFFF),
                          cursorRadius: Radius.circular(8),
                          cursorWidth: 1.8,
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
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(500),
                              borderSide: BorderSide(
                                  color: Color(0xFFFFFFFF), width: 1),
                            ),
                            hintText: "Expected Delivery Date",
                            hintStyle:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                    ),
                            labelText: "Expected Delivery Date",
                            labelStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          validator: (tex) {
                            if (tex == '') {
                              Future.delayed(Duration(seconds: 0))
                                  .then((value) {
                                setState(() {
                                  isDateValid = false;
                                });
                              });
                              return null;
                            } else if (tex.length < 6) {
                              Future.delayed(Duration(seconds: 0))
                                  .then((value) {
                                setState(() {
                                  isDateValid = false;
                                });
                              });
                              return 'Please enter a valid date';
                            }
                            Future.delayed(Duration(seconds: 0)).then((value) {
                              setState(() {
                                if (tex.length != 6) {
                                  isDateValid = true;
                                }
                              });
                            });
                            return null;
                          },
                          onSaved: (String value) {
                            //  _name = value;
                          },
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: SizedBox(
                            height: height * 0.06,
                            width: width * 0.87,
                            child: Text(" "),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 12,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                      controller: msgController,
                      focusNode: _msgFocus,
                      textInputAction: TextInputAction.done,
                      cursorColor: Color(0xFFFFFFFF),
                      cursorRadius: Radius.circular(8),
                      cursorWidth: 1.8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xFFFF0000), width: 1),
                        ),
                        errorText: null,
                        hintText: "Any Special Requests",
                        hintStyle:
                            Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.white,
                                ),
                        labelText: "Any Special Requests",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      onSaved: (String value) {
                        //    _name = value;
                      },
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Checkbox(
                          value: isTNCValid,
                          onChanged: (val) {
                            setState(() {
                              isTNCValid = val;
                            });
                          },
                          activeColor: Colors.black26,
                        ),
                        Text('I agree with the Terms and Conditions')
                      ]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: SubmitButton(
                        validatorSeq: isQuantityValid &&
                            isDateValid &&
                            isPriceValid &&
                            isTNCValid,
                        isLoading: false,
                        width: width,
                        buttonText: "Order",
                        func: () {
                          mail.sendOrderConfirmMail(
                              main.prefs.getString("email"),
                              main.prefs.getString("username"));
                          mail.sendOrderMail(
                              main.prefs.getString("email"),
                              main.prefs.getString("phone"),
                              main.prefs.getString("username"),
                              msgController.text,
                              qtyController.text,
                              priceController.text,
                              dateController.text,
                              product.name,
                              (int.parse(product.price) *
                                      int.parse(qtyController.text))
                                  .toString());
                          Navigator.pop(context);
                          toasts.successContact();
                        }),
                  )
                ]),
          )
        ],
        fab: true);
  }
}
