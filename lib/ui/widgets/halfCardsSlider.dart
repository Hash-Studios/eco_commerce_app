import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HalfCardsSlider extends StatefulWidget {
  final List<Map<String, dynamic>> halfCardData = [
    {"image": "mugs.jpg", "name": "White Mugs"},
    {"image": "cups.jpg", "name": "Coffee Cups"},
    {"image": "plates.jpg", "name": "Serving Dishes"},
    {"image": "forks.jpg", "name": "Stainless Forks"},
  ];
  @override
  _HalfCardsSliderState createState() => _HalfCardsSliderState();
}

class _HalfCardsSliderState extends State<HalfCardsSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned(
            left: -80,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4 -
                  MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width * 1.205,
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                ),
                items: widget.halfCardData.map(
                  (i) {
                    var index = widget.halfCardData.indexOf(i);
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Card(
                                  margin: EdgeInsets.all(0),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.asset(
                                      "assets/images/${i['image']}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: SizedBox.expand(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.black54,
                                              Colors.transparent
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            stops: [0, 0.3]),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    i['name'],
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 22,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),

          // LinearGradient(colors: [Colors.black, Colors.transparent])
        ],
      ),
    );
  }
}
