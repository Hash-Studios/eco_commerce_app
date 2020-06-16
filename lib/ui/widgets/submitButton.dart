import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    @required this.validatorSeq,
    @required this.isLoading,
    @required this.width,
    @required this.buttonText,
    @required this.func,
  }) : super(key: key);

  final bool validatorSeq;
  final bool isLoading;
  final double width;
  final String buttonText;
  final func;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: validatorSeq
                  ? Color(0xFF76ED92).withOpacity(0.4)
                  : Colors.transparent,
              blurRadius: 16,
              offset: Offset(0, 4)),
        ],
        gradient: validatorSeq
            ? LinearGradient(
                colors: [Color(0xFF96EFA6), Color(0xFF26A6B5)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            : LinearGradient(
                colors: [
                  Color(0xFFFFFFFF).withOpacity(0.2),
                  Color(0xFFFFFFFF).withOpacity(0.2)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        borderRadius: BorderRadius.circular(500),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        colorBrightness: Brightness.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
        color: Colors.transparent,
        onPressed: validatorSeq && !isLoading ? func : () {},
        child: SizedBox(
          width: width * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
