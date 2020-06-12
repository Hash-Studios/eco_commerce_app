import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        body: about(),
      ),
    ),
  );
}

class about extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView(
      
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(31.0),
            child: Container(
              height: 42,
              width: 312,
              child: Text('Terms and Conditions',
                  style: TextStyle(
                
                    fontSize: 28.0,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(31.0),
            child: Container(
              alignment: Alignment.topLeft,
              height: 33,
              width: 144,
              child: Text('Return Policy',
                  style: TextStyle(
                
                    fontSize: 22.0,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
            child: Container(
              height: 33,
              width: 153,
              child: Text('lorem ipsum',
                  style: TextStyle(
                
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(31.0),
            child: Container(
              height: 33,
              width: 153,
              child: Text('Privacy Policy',
                  style: TextStyle(
                
                    fontSize: 22.0,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
            child: Container(
              height: 33,
              width: 153,
              child: Text('lorem ipsum',
                  style: TextStyle(
                
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.normal,
                  )),
            ),
          )

        ]);
  }
}
