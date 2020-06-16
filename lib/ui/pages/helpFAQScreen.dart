import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpFAQ extends StatefulWidget {
  HelpFAQ({Key key}) : super(key: key);

  @override
  _HelpFAQState createState() => _HelpFAQState();
}

class _HelpFAQState extends State<HelpFAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            SectionHeader(text: 'Help'),           
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
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
            //SizedBox(height: 10),
            SectionHeader(text: 'FAQ'),
            SectionHeader(text: 'Question 1'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
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
            SectionHeader(text: 'Question 2'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
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
            SectionHeader(text: 'Question 3'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
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
          ]
        ),
      ),    
    );
       
  }
}