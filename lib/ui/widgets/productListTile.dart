import 'dart:math';
// import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProductListTile extends StatefulWidget {
  const ProductListTile({
    Key key,
  }) : super(key: key);

  @override
  _ProductListTileState createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  var images = [
    "assets/images/papers.jpg",
    "assets/images/mugs.jpg",
    "assets/images/cups.jpg",
    "assets/images/pencils.jpg",
    "assets/images/pens.jpg",
    "assets/images/erasers.jpg"
  ];
  String getImage() {
    final _random = new Random();
    var element = images[_random.nextInt(images.length)];
    return element;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ]),
        child: FlatButton(
          onPressed: () {
            print('card');
            // Navigator.pushNamed(context, LoginRoute);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Color(0xFFFFFFFF),
          child: SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: height * 0.16,
                      height: height * 0.16,
                      child: Image.asset(
                        getImage(),
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Text(
                        'PRODUCT NAME',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF044455),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: SizedBox(
                        width: width * 0.435,
                        child: Text(
                          'Lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF7A7A7A),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.514,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              ' ₹ 180 / pc',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF044455),
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(LineAwesomeIcons.heart_o),
                              onPressed: () {
                                print('heart');
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
