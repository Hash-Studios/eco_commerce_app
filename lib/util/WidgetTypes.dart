import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/Home/categoriesWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/gridViewBoxWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/landingSliderWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/popularSliderWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/simpleListWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/subListWidget.dart';
import 'package:eco_commerce_app/ui/widgets/Home/zoomSlideWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ItemWidget {
  Widget landingSliderWidget(BuildContext context, {List<Widget> header});

  Widget popularSliderWidget(BuildContext context, {List<Widget> header});

  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
      {List<Widget> header});

  Widget categoriesWidget(BuildContext context, {List<Widget> header});

  Widget subListWidget(BuildContext context, {List<Widget> header});

  Widget zoomSlideWidget(BuildContext context, {List<Widget> header});

  Widget simpleListWidget(BuildContext context, List<Product> products,
      {List<Widget> header});
}

class LandingSliderWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      LandingSliderWidget(
        header: header,
      );

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}

class PopularSliderWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      PopularSliderWidget(
        header: header,
      );

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}

class GridViewBoxWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      GridViewBoxWidget(
        products: products,
        header: header,
      );

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}

class CategoriesWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) =>
      CategoriesWidget(
        header: header,
      );

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}

class SubListWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) =>
      SubListWidget();

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}

class ZoomSlideWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) =>
      ZoomSlideWidget(
        header: header,
      );
}

class SimpleSlideWidgetType implements ItemWidget {
  @override
  Widget categoriesWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget gridViewBoxWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      null;

  @override
  Widget landingSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget popularSliderWidget(BuildContext context, {List<Widget> header}) =>
      null;

  @override
  Widget simpleListWidget(BuildContext context, List<Product> products,
          {List<Widget> header}) =>
      SimpleSlideWidget(
        products: products,
        header: header,
      );

  @override
  Widget subListWidget(BuildContext context, {List<Widget> header}) => null;

  @override
  Widget zoomSlideWidget(BuildContext context, {List<Widget> header}) => null;
}
