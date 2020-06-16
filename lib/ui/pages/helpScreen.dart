import 'package:eco_commerce_app/ui/widgets/appBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen({Key key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(text: "Help"),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.arrow_left),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontStyle: FontStyle.normal,
                    fontFamily: '',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
