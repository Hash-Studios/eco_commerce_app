import 'package:eco_commerce_app/ui/widgets/appBarTitle.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppBarTitle(text: "About"),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            TrendingSlider(),
            SectionHeader(text: "Our Mission"),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum .',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontFamily: '',
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            SectionHeader(text: "Our Values"),
            // HalfSlider(),
            SectionHeader(text: "Who are we?"),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus a velit suscipit tempus nec maximus felis. Nullam convallis arcu non congue ultricies. In orci massa, sollicitudin ut fermentum vel, commodo sed libero. Sed ac efficitur ipsum. Donec eu magna eu mi aliquam interdum .',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                      fontFamily: '',
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            SectionHeader(text: "Meet our team!"),
            // HalfSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Developed with ❤ by Hash Studios',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
