import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class LandingSlider extends StatefulWidget {
  @override
  _LandingSliderState createState() => _LandingSliderState();
}

class _LandingSliderState extends State<LandingSlider> {
  bool autoplay = false;
  int _current = 0;
  List<String> images = [
    "assets/images/bottles.jpg",
    "assets/images/journals.jpg",
    "assets/images/mugs.jpg",
    "assets/images/bags.jpg",
    "assets/images/table_lamps.jpg",
    "assets/images/scissors.jpg"
  ];

  List<String> messages = [
    "assets/images/bottles.jpg",
    "assets/images/journals.jpg",
    "assets/images/mugs.jpg"
  ];

  List<LinearGradient> gradients = [
    config.Colors().peachy,
    config.Colors().nebula,
    config.Colors().aqua,
    config.Colors().peachy,
    config.Colors().nebula,
    config.Colors().aqua
  ];

  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      setState(() {
        autoplay = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: autoplay,
            autoPlayInterval: Duration(seconds: 5),
            height: height * 0.57,
            viewportFraction: 1.0,
            autoPlayCurve: Curves.easeInOutExpo,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, CategoriesRoute);
                  },
                );
              },
            );
          }).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((String image) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                      color: _current == images.indexOf(image)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.4)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
