import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Write about your product',
                style: TextStyle(
                    fontFamily: '', fontSize: 20, fontWeight: FontWeight.normal),
              ),
            // Form(
              // key: _formkey,
              
                  Padding(
                padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: Color(0xFF000000),
                  cursorRadius: Radius.circular(8),
                  cursorWidth: 1.8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                      labelText: 'Organization Name'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Organization Name';
                    }

                    return null;
                  },
                  onSaved: (String value) {
                 //   _name = value;
                  },
                ),
              ),
           

                Padding(
                  padding: const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    cursorColor: Color(0xFF000000),
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 1.8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF000000), width: 2),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        labelText: 'Qty'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Qty';
                      }

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
                    textInputAction: TextInputAction.next,
                    cursorColor: Color(0xFF000000),
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 1.8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF000000), width: 2),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        labelText: 'Price Offered'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Price Offered';
                      }

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
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: Color(0xFF000000),
                  cursorRadius: Radius.circular(8),
                  cursorWidth: 1.8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                      labelText: 'Expected Date Of Delevery'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Expected Date of Dilevery';
                    }

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
                  textInputAction: TextInputAction.next,
                  cursorColor: Color(0xFF000000),
                  cursorRadius: Radius.circular(8),
                  cursorWidth: 1.8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 2),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 100),
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
                      labelText: 'Your Message'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Your Message';
                    }

                    return null;
                  },
                  onSaved: (String value) {
                //    _name = value;
                  },
                ),
              ) ,
    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,                
                children: <Widget>[
                 // Checkbox(value: mon, onChanged: )
                Text('I agree with the Terms and Conditions')
                ]
            ) , 
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15.6, 31, 15.6),
              child: Container(
               margin: EdgeInsets.symmetric(vertical:5.0,horizontal:5.0),
              decoration: BoxDecoration(
                   color: Colors.black,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10))
              ),
                
                child: Text('Submit',style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            )
            ]),
                ),
      )),
  ));
}
