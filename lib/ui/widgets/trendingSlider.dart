import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatefulWidget {
  @override
  _TrendingSliderState createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
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
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: autoplay,
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
                return GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
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
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white10,
                              Colors.white70,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      )
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
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((String image) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //     color: _current == images.indexOf(image)
                      //         ? Colors.white
                      //         : Colors.white70,
                      //     width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(500),
                      ),
                      color: _current == images.indexOf(image)
                          ? Theme.of(context).accentColor
                          : Theme.of(context).accentColor.withOpacity(0.4)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
