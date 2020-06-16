import 'package:flutter/material.dart';

class GradientBanner extends StatelessWidget {
  const GradientBanner({
    Key key,
    @required this.gradient,
    @required this.message,
  }) : super(key: key);

  final LinearGradient gradient;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 30, 50),
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
