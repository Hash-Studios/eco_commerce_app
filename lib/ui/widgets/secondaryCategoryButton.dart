import 'package:flutter/material.dart';

class SecondaryCategoryButton extends StatelessWidget {
  const SecondaryCategoryButton({
    Key key,
    @required this.width,
    @required this.text,
    @required this.function,
  }) : super(key: key);

  final double width;
  final String text;
  final function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.415,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF004445).withOpacity(0.2),
                blurRadius: 12,
                offset: Offset(0, 3))
          ]),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        colorBrightness: Brightness.light,
        padding: EdgeInsets.all(0),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 10, 15),
              child: Container(
                width: width * 0.365,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: Color(0xFF004445),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
