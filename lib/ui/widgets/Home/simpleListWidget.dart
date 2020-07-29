import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';

class SimpleSlideWidget extends StatefulWidget {
  final List<Product> products;
  final List<Widget> header;

  SimpleSlideWidget({this.products, this.header});

  @override
  _SimpleSlideWidgetState createState() => _SimpleSlideWidgetState();
}

class _SimpleSlideWidgetState extends State<SimpleSlideWidget> {
  List<Widget> trending = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.products == null)
        ? Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          )
        : Column(
            children: ((widget.header != null) ? widget.header : <Widget>[]) +
                <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Builder(
                        builder: (context) {
                          trending = [];
                          for (int index = 0;
                              index < widget.products.length;
                              index++) {
                            trending.add(ProductListTileDynamic(
                                arguements: [widget.products[index]]));
                          }
                          return Column(children: trending);
                        },
                      ))
                ],
          );
  }
}
