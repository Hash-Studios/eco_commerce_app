import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatefulWidget {
  @override
  _TrendingSliderState createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  int _current = 0;
  List<String> images = [
    "assets/images/greeting_cards.jpg",
    "assets/images/journals.jpg",
    "assets/images/mugs.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            height: 240,
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
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((String image) {
                return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: _current == images.indexOf(image)
                          ? Color(0xFF044455)
                          : Color(0xFF044455).withOpacity(0.5)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
