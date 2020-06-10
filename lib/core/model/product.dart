import 'package:eco_commerce_app/core/model/image.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String id;
  final String price;
  final List<ProductImage> images;
  final String category;
  final String ratings;
  final String discount;
  final String desc;
  final String features;
  final String createdAt;
  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.images,
    @required this.category,
    @required this.ratings,
    @required this.discount,
    @required this.desc,
    @required this.features,
    @required this.createdAt,
  });
}
