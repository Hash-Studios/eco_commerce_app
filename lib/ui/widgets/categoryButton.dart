import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

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
      width: width * 0.38,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          gradient: config.Colors().mildSeaRev,
          borderRadius: BorderRadius.all(
            Radius.circular(500),
          ),
          boxShadow: [
            BoxShadow(
                color: config.Colors().secondColor(0.4),
                blurRadius: 12,
                offset: Offset(0, 3))
          ]),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(500),
          ),
        ),
        colorBrightness: Brightness.light,
        padding: EdgeInsets.all(0),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Image(
                image: AssetImage(
                  image,
                ),
                height: 43,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Container(
                // width: width * 0.24,
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.button,
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
