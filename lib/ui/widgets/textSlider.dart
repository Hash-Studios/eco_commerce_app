import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';

class TextSlider extends StatefulWidget {
  @override
  _TextSliderState createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> {
  bool autoplay = false;
  int _current = 0;
  List<String> images = [
    "assets/images/greeting_cards.jpg",
    "assets/images/journals.jpg",
    "assets/images/mugs.jpg"
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
    // print(_current);
    final width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: autoplay,
        pauseAutoPlayOnTouch: false,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 5),
        height: 240,
        viewportFraction: 1.0,
        autoPlayCurve: Curves.fastOutSlowIn,
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
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                height: 200,
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            images[images.indexOf(image)]
                                .toString()
                                .replaceAll(".jpg", "")
                                .replaceAll("assets/images/", "")
                                .replaceAll("_", " ")
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).accentColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, CategoriesRoute);
              },
            );
          },
        );
      }).toList(),
    );
  }
}
