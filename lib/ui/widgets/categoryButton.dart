import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key key,
    @required this.width,
    @required this.text,
    @required this.image,
    @required this.function,
  }) : super(key: key);

  final double width;
  final String text;
  final String image;
  final function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: Color(0xFF004445),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF004445).withOpacity(0.5),
                blurRadius: 12,
                offset: Offset(0, 3))
          ]),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        colorBrightness: Brightness.dark,
        padding: EdgeInsets.all(0),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Image(
                image: AssetImage(
                  image,
                ),
                height: 43,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 10, 15),
              child: Hero(
                transitionOnUserGestures: true,
                tag: text,
                child: Container(
                  width: width * 0.24,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          color: Colors.white),
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
