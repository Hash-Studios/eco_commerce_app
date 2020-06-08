import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: CarouselSlider(
        items: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Image.asset(
                'assets/images/preSignUpSlider1.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Image.asset(
                'assets/images/preSignUpSlider2.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: Image.asset(
                'assets/images/preSignUpSlider3.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: height * 0.5,
          viewportFraction: 1,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutExpo,
        ),
      ),
    );
  }
}