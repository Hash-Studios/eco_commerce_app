import 'package:flutter/material.dart';

class PopularSlider extends StatefulWidget {
  @override
  _PopularSliderState createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  final List<Map> numbers = [
    {'name': 'Bags', 'image': 'assets/images/bags.jpg'},
    {'name': 'Chairs', 'image': 'assets/images/chairs.jpg'},
    {'name': 'Lamps', 'image': 'assets/images/table_lamps.jpg'},
    {'name': 'Plants', 'image': 'assets/images/on_desk_plants.jpg'},
    {'name': 'Carry Bags', 'image': 'assets/images/carry_bags.jpg'},
    {'name': 'Cards', 'image': 'assets/images/greeting_cards.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: -2.0,
                            blurRadius: 10.0,
                            offset: Offset(0, 5)),
                      ],
                      image: DecorationImage(
                          image: AssetImage(numbers[index]['image']),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      child: Center(
                          child: Text(
                        '',
                        style: TextStyle(color: Colors.white, fontSize: 36.0),
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            numbers[index]['name'].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
