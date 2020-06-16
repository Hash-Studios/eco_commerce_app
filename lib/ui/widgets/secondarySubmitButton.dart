import 'package:flutter/material.dart';

class SecondarySubmitButton extends StatelessWidget {
  final String text;
  final String boldText;
  final String routeName;
  const SecondarySubmitButton(
      {Key key,
      @required this.text,
      @required this.boldText,
      @required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(500))),
        child: SizedBox(
          width: width * 0.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text + '?  ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto",
                    ),
              ),
              Text(
                boldText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
