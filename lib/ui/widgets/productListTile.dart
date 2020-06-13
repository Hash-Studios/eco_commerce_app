import 'dart:math';
// import 'package:eco_commerce_app/routing_constants.dart';
// import 'package:eco_commerce_app/core/model/image.dart';
// import 'package:eco_commerce_app/core/model/product.dart';
// import 'package:eco_commerce_app/routing_constants.dart';
// import 'package:eco_commerce_app/ui/pages/productDetailsScreen.dart';
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
    "assets/images/erasers.jpg",
    "assets/images/rulers.jpg",
    "assets/images/spoons.jpg",
    "assets/images/picture_frames.jpg",
    "assets/images/calendars.jpg",
    "assets/images/mousepads.jpg",
  ];

  //Dummy Data
  // static ProductImage productImage = new ProductImage(
  //     id: "1",
  //     name: "Hand Sanitizer",
  //     ext: ".png",
  //     size: "50",
  //     width: "200",
  //     height: "100",
  //     url:
  //         "https://cdn.pixabay.com/photo/2013/07/12/17/49/landscape-152502__340.png",
  //     thumbnailUrl:
  //         "https://cdn.pixabay.com/photo/2013/07/12/17/49/landscape-152502__340.png",
  //     smallUrl:
  //         "https://cdn.pixabay.com/photo/2013/07/12/17/49/landscape-152502__340.png",
  //     createdAt: "8/6/20");
  // static List<ProductImage> productImages = [
  //   productImage,
  //   productImage,
  //   productImage,
  //   productImage
  // ];
  // Product product = new Product(
  //     id: "1",
  //     name: "Hand Sanitizer",
  //     price: "341.00",
  //     images: productImages,
  //     category: "Health",
  //     desc:
  //         "Discover more great images on our sponsor's site,Discover more great images on our sponsor's site,Discover more great images on our sponsor's sit,Discover more great images on our sponsor's sitee.",
  //     features:
  //         "Advance Cleaning 100+ Protection More Protection les germs Blah Blah Blah Bla More Protection les germs Blah Blah Blah More Protection les germs Blah Blah Blah Bla Blah Blah Blah More Protection les germs Blah Blah Blah Bla",
  //     createdAt: "6/05/20");

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
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          onPressed: () {
            print('card');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => ProductDetailsScreen(product)),
            // );
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
                          vertical: 7, horizontal: 15),
                      child: Text(
                        'PRODUCT NAME',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004445),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
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
                                  color: Color(0xFF004445),
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                icon: Icon(LineAwesomeIcons.bookmark_o),
                                onPressed: () {
                                  print('heart');
                                })
                          ],
                        ),
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
