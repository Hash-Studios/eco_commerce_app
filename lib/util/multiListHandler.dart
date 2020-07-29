import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/gradientBanner.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/util/WidgetTypes.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/main.dart' as main;

class MultiListHandler extends StatefulWidget {
  final double height;
  final double width;
  final List<Product> products;

  MultiListHandler({this.height, this.width, this.products});

  @override
  _MultiListHandlerState createState() => _MultiListHandlerState();
}

class _MultiListHandlerState extends State<MultiListHandler> {
  List<int> whichWidget = [
    1,
    2,
    3,
    2,
    4,
    5,
    6,
    5,
    3,
    7,
    1,
    2,
    1,
    2,
    3,
    2,
    5,
    6,
    5,
    3,
    7,
    1,
    2,
    2,
    3,
    2,
    5,
    6,
    5,
    3,
    7,
    1,
    2,
    2,
    3,
    2,
    5,
    6,
    5,
    3,
    7,
    1,
    2,
    2,
    3,
    2,
    5,
    6,
    5,
    3,
    7,
    1,
    2,
    2,
    3,
    2,
    5,
    6,
    5,
    3,
    7,
    1,
    2
  ];
  List<ItemWidget> items;
  double height;
  double width;

  @override
  void initState() {
    super.initState();

    width = widget.width;
    height = widget.height;

    items = List<ItemWidget>.generate(
        whichWidget.length,
        (index) => ((whichWidget[index] == 1)
            ? LandingSliderWidgetType()
            : (whichWidget[index] == 2)
                ? PopularSliderWidgetType()
                : (whichWidget[index] == 3)
                    ? GridViewBoxWidgetType()
                    : (whichWidget[index] == 4)
                        ? CategoriesWidgetType()
                        : (whichWidget[index] == 5)
                            ? SimpleSlideWidgetType()
                            : (whichWidget[index] == 6)
                                ? SubListWidgetType()
                                : ZoomSlideWidgetType()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: ListView.builder(
          itemCount: whichWidget.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return (whichWidget[index] == 1)
                ? item.landingSliderWidget(context, header: [])
                : (whichWidget[index] == 2)
                    ? item.popularSliderWidget(context, header: [
                        (index > 2)
                            ? _userGradientBanner()
                            : _textBanner("Popular Now")
                      ])
                    : (whichWidget[index] == 3)
                        ? item.gridViewBoxWidget(
                            context, widget.products.sublist(1, 5),
                            header: [(index > 4) ? _userGradientBanner() : _gradientBanner()])
                        : (whichWidget[index] == 4)
                            ? item.categoriesWidget(context,
                                header: [_textBanner("Categories")])
                            : (whichWidget[index] == 5)
                                ? item.simpleListWidget(
                                    context, widget.products.sublist(1, 6), header: [
                                    _emptyBoxBanner(height: 30),
                                    _textBanner("Trending Products")
                                  ])
                                : (whichWidget[index] == 6)
                                    ? item.subListWidget(context, header: [])
                                    : item.zoomSlideWidget(context,
                                        header: [_textBanner("Disposables")]);
          }),
    );
  }

  Widget _textBanner(String text) {
    return SectionHeader(
      text: text,
    );
  }

  Widget _userGradientBanner() {
    return GradientBanner(
      gradient: config.Colors().peachy,
      message:
          "While you are here ${main.prefs.getString('username').toString().split(" ")[0]}, do check these amazing offers!",
    );
  }

  Widget _gradientBanner() {
    return GradientBanner(
        gradient: config.Colors().alive,
        message: "Find the greatest collection of Natural Products!");
  }

  Widget _emptyBoxBanner({double height}) {
    return SizedBox(
      height: height,
    );
  }
}
