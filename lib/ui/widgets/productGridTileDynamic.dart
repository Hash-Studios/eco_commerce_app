// import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProductGridTileDynamic extends StatefulWidget {
  final List<Product> arguements;
  ProductGridTileDynamic({this.arguements});

  @override
  _ProductGridTileDynamicState createState() => _ProductGridTileDynamicState();
}

class _ProductGridTileDynamicState extends State<ProductGridTileDynamic> {
  String image;
  String name;
  String desc;
  String price;

  @override
  void initState() {
    super.initState();
    // 'https://ecocommerce.herokuapp.com' +
    // products[index]["images"][0]["url"],
    image = 'assets/images' +
        widget.arguements[0].images[0].url
            .toString()
            .split("_")[0]
            .toString()
            .replaceAll("/uploads", "") +
        ".jpg";
    name = widget.arguements[0].name;
    desc = widget.arguements[0].desc;
    price = widget.arguements[0].price.toString();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          onPressed: () {
            print('card');
            Navigator.pushNamed(context, ProductRoute,
                arguments: widget.arguements);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Color(0xFFFFFFFF),
          child: SizedBox(
            width: width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: name,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: height * 0.21,
                        height: height * 0.235,
                        // child: Image.network(
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 5),
                      child: Container(
                        width: width * 0.45,
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: SizedBox(
                        width: width * 0.435,
                        child: Text(
                          desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                                  vertical: 5, horizontal: 5),
                              child: Text(
                                ' ₹$price',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline3,
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
