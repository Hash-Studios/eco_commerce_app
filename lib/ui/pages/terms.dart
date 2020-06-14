import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Hero(
          transitionOnUserGestures: true,
          tag: 'menu',
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
              icon: Icon(LineAwesomeIcons.arrow_left),
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    Text('Terms and Conditions',
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),
            SectionHeader(text: 'Return Policy'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontFamily: '',
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            SectionHeader(text: "Privacy Policy"),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
              child: Container(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum et sit amet dui. Donec non tellus nec est cursus dictum. Ut malesuada ornare arcu, eu maximus sapien semper sed. In hac habitasse platea dictumst.Aliquam quis tortor sit amet libero lobortis euismod. Cras sit amet commodo ex. Nunc sodales mi vestibulum diam eleifend, vitae laoreet enim ullamcorper. Suspendisse euismod sagittis enim, ac hendrerit lorem ullamcorper nec. Pellentesque est urna, pharetra sed elit vel, eleifend fringilla justo.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontFamily: '',
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
