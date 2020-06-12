import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      body: new landing(),
    )),
  );
}

class landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                width: 240,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.search,color: Colors.black,),
                    
             
                  ],
                ),
              ),
            ),
            Text(
              'Cancel',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
            ),
           ],
         ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           chip('STATIONARY', Colors.white ) ,
           chip('MUG', Colors.white ) ,
           chip('CUP', Colors.white ) ,
           ], ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            chip('PLANTS', Colors.white ) ,
             chip('LOREM IPSUM LOREM', Colors.white ) ,
          ],
        ),
      ],
    );
  }
}


Widget chip (String label,Color color)
{
  return Container(
    margin: EdgeInsets.all(6.0),
      child: Chip(
    label: Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  backgroundColor: color,
              padding: EdgeInsets.all(10.0),
              shape: StadiumBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.blueAccent)
              ),
    ),
  );
}

