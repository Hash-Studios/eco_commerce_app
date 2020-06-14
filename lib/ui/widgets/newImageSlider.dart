// import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewImageSlider extends StatefulWidget {
  final double height;
  final bool showIndicator;
  final List<String> itemsList;

  // if not asset then will be treated as network image [ we assume this is specifically for Images]
  final bool isAsset;

  NewImageSlider(
      {this.height,
      @required this.itemsList,
      this.showIndicator,
      @required this.isAsset});

  @override
  _NewImageSliderState createState() => _NewImageSliderState();
}

class _NewImageSliderState extends State<NewImageSlider> {
  bool autoplay = false;
  List<Widget> items;
  List<Widget> dots;
  int idx = 0;
  @override
  void initState() {
    items = new List();
    dots = new List();
    createItems();
    if (widget.showIndicator) {
      createDots(widget.itemsList.length);
    }
    idx = 0;
    super.initState();
    if (this.mounted) {
      setState(() {
        autoplay = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                  height: widget.height * 0.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: autoplay,
                  autoPlayCurve: Curves.easeInOutExpo,
                  onPageChanged: (i, r) {
                    if (widget.showIndicator) {
                      setState(() {
                        Widget w = dots[idx];
                        dots[idx] = dots[i];
                        dots[i] = w;
                        idx = i;
                      });
                    }
                  }),
              carouselController: _controller,
            ),
            Container(
              margin: EdgeInsets.only(top: 3, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dots,
              ),
            )
          ],
        ));
  }

  void createDots(int count) {
    if (count == 1) return;
    Widget dotWhite = Container(
      height: 6,
      width: 6,
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(50)),
    );
    Widget dotBlack = Container(
      height: 6,
      width: 6,
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)),
    );

    dots.add(dotBlack);
    count--;
    while (count > 0) {
      count--;
      dots.add(dotWhite);
    }
  }

  void createItems() {
    //TODO:: ADD Default Image -404
    //TODO:: ADD Network Image

    if (widget.isAsset)
      for (int i = 0; i < widget.itemsList.length; i++) {
        items.add(assetWidget(widget.itemsList[i]));
      }
    else
      for (int i = 0; i < widget.itemsList.length; i++) {
        items.add(networkWidget(widget.itemsList[i]));
      }
  }

  Widget assetWidget(String url) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Image.asset(
          url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget networkWidget(String url) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
