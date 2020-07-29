import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/categoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/secondaryCategoryButton.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final List<Widget> header;

  CategoriesWidget({this.header});

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  double height;
  double width;

  List<String> categories;
  List<String> categoriesAssets;

  @override
  void initState() {
    super.initState();

    categories = new List();
    categoriesAssets = new List();

    categories.addAll(["Cups", "Pens", "Plants", "Masks", "Paper"]);
    categoriesAssets.addAll([
      "assets/icons/cup.png",
      "assets/icons/pen.png",
      "assets/icons/plant.png",
      "assets/icons/mask.png",
      "assets/icons/paper.png",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ((widget.header != null) ? widget.header : <Widget>[]) +
          <Widget>[
            Container(
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: categories[0],
                    image: categoriesAssets[0],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [categories[0]],
                      );
                    },
                  ),
                  CategoryButton(
                    width: width,
                    text: categories[1],
                    image: categoriesAssets[1],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [categories[1]],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: categories[2],
                    image: categoriesAssets[2],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [categories[2]],
                      );
                    },
                  ),
                  CategoryButton(
                    width: width,
                    text: categories[3],
                    image: categoriesAssets[3],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [categories[3]],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CategoryButton(
                    width: width,
                    text: categories[4],
                    image: categoriesAssets[4],
                    function: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [categories[4]],
                      );
                    },
                  ),
                  SecondaryCategoryButton(
                    width: width,
                    text: "See All",
                    function: () {
                      Navigator.pushNamed(context, CategoriesRoute);
                    },
                  ),
                ],
              ),
            )
          ],
    );
  }
}
