import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  bool autoplay = false;

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
    return Padding(
      padding: const EdgeInsets.only(top: 0),
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
          height: widget.height * 0.5,
          viewportFraction: 0.95,
          enlargeCenterPage: true,
          autoPlay: autoplay,
          autoPlayCurve: Curves.easeInOutExpo,
        ),
      ),
    );
  }
}
