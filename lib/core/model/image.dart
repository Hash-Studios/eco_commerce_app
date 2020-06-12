import 'package:flutter/material.dart';

class ProductImage {
  final String id;
  final String name;
  final String ext;
  final String size;
  final String width;
  final String height;
  final String url;
  final String thumbnailUrl;
  final String smallUrl;
  final String createdAt;
  ProductImage({
    @required this.id,
    @required this.name,
    @required this.ext,
    @required this.size,
    @required this.width,
    @required this.height,
    @required this.url,
    @required this.thumbnailUrl,
    @required this.smallUrl,
    @required this.createdAt,
  });
}
