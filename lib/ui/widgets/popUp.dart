import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

Future popUpAlertDialog({
  BuildContext context,
  String text,
  Function func1,
  Function func2,
  bool twoButtons,
  String button1text,
  String button2text,
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFF07590),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          actions: [
            twoButtons == true
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.051,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.transparent,
                                    blurRadius: 16,
                                    offset: Offset(0, 4)),
                              ],
                              gradient: LinearGradient(
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
                              onPressed: func1 == null ? () {} : func1,
                              child: Text(
                                button1text == null ? "OK" : button1text,
                                style: Theme.of(context).textTheme.button,
                              ),
                            )
                            //  RaisedButton(
                            //   color: Color(0xFFFFFFFF),
                            //   elevation: 0.0,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(32.0),
                            //   ),
                            //   onPressed: func1 == null ? () {} : func1,
                            // child: Text(
                            //   button1text == null ? "OK" : button1text,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .button
                            //       .copyWith(
                            //           color: config.Colors().secondColor(1)),
                            // ),
                            // ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.051,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF76ED92).withOpacity(0.4),
                                    blurRadius: 16,
                                    offset: Offset(0, 4)),
                              ],
                              gradient: LinearGradient(
                                colors: [Color(0xFF96EFA6), Color(0xFF26A6B5)],
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
                              onPressed: func2 == null ? () {} : func2,
                              child: Text(
                                button2text == null ? "OK" : button2text,
                                style: Theme.of(context).textTheme.button,
                              ),
                            )
                            // RaisedButton(
                            //   color: Color(0xFF004445),
                            //   elevation: 0.0,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(32.0),
                            //   ),
                            //   onPressed: func2 == null ? () {} : func2,
                            // child: Text(
                            //   button2text == null ? "OK" : button2text,
                            //   style: Theme.of(context).textTheme.button,
                            // ),
                            // ),
                            ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.051,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 16,
                                offset: Offset(0, 4)),
                          ],
                          gradient: LinearGradient(
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
                          onPressed: func1 == null ? () {} : func1,
                          child: Text(
                            button1text == null ? "OK" : button1text,
                            style: Theme.of(context).textTheme.button,
                          ),
                        )
                        // RaisedButton(
                        //   color: Color(0xFF004445),
                        //   elevation: 0.0,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(32.0),
                        //   ),
                        //   onPressed: func1 == null ? () {} : func1,
                        // child: Text(
                        //   button1text == null ? "OK" : button1text,
                        //   style: Theme.of(context).textTheme.button,
                        // ),
                        // ),
                        ),
                  ),
          ],
        );
      });
}
