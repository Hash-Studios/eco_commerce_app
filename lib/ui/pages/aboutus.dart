import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back, color: Colors.black)),
        body: aboutus()),
  ));
}

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 10, 31, 10),
          child: Container(
            height: 33,
            width: 100,
            child: Text('About us',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        TrendingSlider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 10, 31, 10),
          child: Container(
            height: 33,
            width: 129,
            child: Text('Our Mission',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 10, 31, 10),
          child: Container(
            height: 33,
            width: 122,
            child: Text('Our Values',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        list(),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 10, 31, 10),
          child: Container(
            height: 33,
            width: 143,
            child: Text('Who are we?',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 3, 31, 3),
          child: Container(
            height: 42,
            width: 312,
            child: Text('lorem',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(31, 10, 31, 10),
          child: Container(
            height: 33,
            width: 173,
            child: Text('Meet our team',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontFamily: '',
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
        list(),
      ],
    );
  }
}



// list view


class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  List<String> images = [
    "assets/images/greeting_cards.jpg",
    "assets/images/journals.jpg",
    "assets/images/mugs.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 128,
              width:82,
              margin: EdgeInsets.all(2),
              child: Image.asset('${images[index]}'),);
        },
      ),
    );
  }
}



// carosel slider




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
            height: 128,
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
