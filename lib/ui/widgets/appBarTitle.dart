import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  AppBarTitle({@required this.text});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Container(
              width: width * 0.655,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
