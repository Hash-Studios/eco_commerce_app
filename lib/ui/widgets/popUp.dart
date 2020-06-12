import 'package:flutter/material.dart';

Future popUpAlertDialog(
    {BuildContext context,
    String text,
    Function func1,
    Function func2,
    bool twoButtons,
    String button1text,
    String button2text}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
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
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 10,
                                    color: Color(0xFF004445))
                              ]),
                          child: RaisedButton(
                            color: Color(0xFF004445),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            onPressed: func1 == null ? () {} : func1,
                            child: Text(
                              button1text == null ? "OK" : button1text,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.051,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 10,
                                    color: Color(0xFF004445))
                              ]),
                          child: RaisedButton(
                            color: Color(0xFF004445),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            onPressed: func2 == null ? () {} : func2,
                            child: Text(
                              button2text == null ? "OK" : button2text,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
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
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                color: Color(0xFF004445))
                          ]),
                      child: RaisedButton(
                        color: Color(0xFF004445),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        onPressed: func1 == null ? () {} : func1,
                        child: Text(
                          button1text == null ? "OK" : button1text,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
          ],
        );
      });
}
