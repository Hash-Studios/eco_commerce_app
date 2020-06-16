import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionHeader(text: "About Us"),
            TrendingSlider(),
            SectionHeader(text: "Our Mission"),
            Padding(
              padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
              child: Container(
                height: 42,
                width: 312,
                child: Text('Lorem',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
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
              padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
              child: Container(
                height: 42,
                width: 312,
                child: Text('Lorem',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontFamily: '',
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
            SectionHeader(text: "Meet our team!"),
            // HalfSlider(),
          ],
        ),
      ),
    );
  }
}
