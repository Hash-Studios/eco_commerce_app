import 'package:eco_commerce_app/core/model/product.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final List<Product> products;
  final String createdAt;
  Category({
    @required this.id,
    @required this.name,
    @required this.products,
    @required this.createdAt,
  });
}
