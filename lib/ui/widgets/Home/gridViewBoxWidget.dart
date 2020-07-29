import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/productGridTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class GridViewBoxWidget extends StatefulWidget {
  final List<Product> products;
  final List<Widget> header;

  GridViewBoxWidget({this.products, this.header});

  @override
  _GridViewBoxWidgetState createState() => _GridViewBoxWidgetState();
}

class _GridViewBoxWidgetState extends State<GridViewBoxWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.products == null || widget.products.length < 4)
        ? Container()
        : Column(
            children: ((widget.header != null) ? widget.header : <Widget>[]) +
                <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: config.Colors().alive,
                    ),
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.58,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return ProductGridTileDynamic(
                              arguements: [widget.products[index]]);
                        }),
                  )
                ],
          );
  }
}
