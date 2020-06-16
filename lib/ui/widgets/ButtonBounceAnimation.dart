import 'dart:async';

import 'package:flutter/cupertino.dart';

class ButtonBounceAnimation extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final double scale;
  final int duration;
  final double how;
  final Function onTapCallBack;
  final Function onTap;
  final Function onDoubleTap;

  ButtonBounceAnimation(
      {@required this.child,
      @required this.width,
      @required this.height,
      @required this.scale,
      @required this.duration,
      @required this.how,
      this.onTap,
      this.onTapCallBack,
      this.onDoubleTap});

  @override
  _ButtonBounceAnimationState createState() => _ButtonBounceAnimationState();
}

class _ButtonBounceAnimationState extends State<ButtonBounceAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration,
      ),
      lowerBound: 0.0,
      upperBound: widget.how,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _controller.value;
    return GestureDetector(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      child: Transform.scale(
        scale: scale,
        child: Container(
            height: widget.height,
            width: widget.width,
            child: widget.child),
      ),
    );
  }

  void _onTap() {
    if (widget.onTap != null) widget.onTap();
    _controller.forward();
    Timer(Duration(milliseconds: (widget.duration / 2).floor()), () {
      _controller.reverse();
      if (widget.onTapCallBack != null) widget.onTapCallBack();
    });
  }
  void _onDoubleTap() {
    if (widget.onDoubleTap != null) widget.onDoubleTap();
  }
}
