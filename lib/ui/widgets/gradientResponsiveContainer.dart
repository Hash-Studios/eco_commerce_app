import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class GradientResponsiveContainer extends StatefulWidget {
  const GradientResponsiveContainer({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldLoginKey,
    @required this.gradient,
    @required this.height,
    @required this.widgets,
    @required this.fab,
  })  : _scaffoldLoginKey = scaffoldLoginKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldLoginKey;
  final LinearGradient gradient;
  final double height;
  final List<Widget> widgets;
  final bool fab;

  @override
  _GradientResponsiveContainerState createState() =>
      _GradientResponsiveContainerState();
}

class _GradientResponsiveContainerState
    extends State<GradientResponsiveContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget._scaffoldLoginKey,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: widget.gradient,
            ),
            child: SizedBox(
              height: widget.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.widgets,
                ),
              ),
            ),
          ),
          widget.fab
              ? Positioned(
                  top: 60,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      LineAwesomeIcons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                    elevation: 0,
                    highlightElevation: 0,
                    disabledElevation: 0,
                    focusElevation: 0,
                    splashColor: Colors.transparent,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
