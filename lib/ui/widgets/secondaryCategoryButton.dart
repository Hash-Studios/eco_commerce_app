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
      width: width * 0.38,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(500),
          ),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).focusColor.withOpacity(0.15),
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
              child: Container(
                // width: width * 0.365,
                child: Center(
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Theme.of(context).accentColor),
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
