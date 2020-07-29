import 'package:eco_commerce_app/ui/widgets/textSlider.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';

class SubListWidget extends StatefulWidget {
  final List<Widget> header;

  SubListWidget({this.header});

  @override
  _SubListWidgetState createState() => _SubListWidgetState();
}

class _SubListWidgetState extends State<SubListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: ((widget.header != null) ? widget.header : <Widget>[]) +
          <Widget>[
            Stack(
              children: <Widget>[
                TrendingSlider(),
                TextSlider(),
              ],
            )
          ],
    );
  }
}
