import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class GoogleButton extends StatefulWidget {
  final bool login;
  final String text;
  const GoogleButton({
    @required this.login,
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool loader = false;
  bool isError = false;
  Map<String, dynamic> res;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Consumer<CurrentUser>(
        builder: (_, currentUser, __) => Container(
          decoration: widget.login
              ? BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFEFF5FF).withOpacity(0.4),
                        blurRadius: 16,
                        offset: Offset(0, 4)),
                  ],
                  borderRadius: BorderRadius.circular(500),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(500),
                ),
          child: FlatButton(
            colorBrightness: Brightness.light,
            padding: EdgeInsets.all(0),
            shape: StadiumBorder(),
            onPressed:_redirectUser,
            child: SizedBox(
              width: width * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/google.png',
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(widget.text,
                          textAlign: TextAlign.center,
                          style: widget.login
                              ? Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: config.Colors().mainColor(1))
                              : Theme.of(context).textTheme.button.copyWith(
                                  color: Theme.of(context).primaryColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _redirectUser() {
    Future.delayed(Duration(seconds: 1))
        .then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
  }
}
