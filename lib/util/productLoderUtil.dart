import 'dart:collection';
import 'dart:convert';

import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductLoader {
  static HashMap<String, Product> _cashedProducts =
      new HashMap<String, Product>();

  // load by id will also be useful if we have ids of similar products
  static Future<Product> loadProductById(String id) async {
    if (!_cashedProducts.containsKey(id)) {
      await _loader(id: id).then((value) {
        return _cashedProducts[id];
      });
    }
    return _cashedProducts[id];
  }

  static Future<List<Product>> loadProducts() async {
    List<Product> _products = new List();
    if (_cashedProducts.length == 0) {
      await _loader().then((value) {
        _cashedProducts.forEach((key, value) {
          _products.add(value);
        });
      });
    } else {
      _cashedProducts.forEach((key, value) {
        _products.add(value);
      });
    }
    return _products;
  }

 // In these we can write our algorithm to fetch similar/search/etc
//  static loadProductsByTag() {}
//  static loadProductsByQuery() {}

  //loader with optional argument id to load item with id.
  static _loader({String id}) async {
    await http
        .get(
      'https://ecocommerce.herokuapp.com/products' +
          ((id != null) ? '/' + id : ""),
    )
        .then((http.Response res) {
      print("------");
      print(json.decode(res.body));
      print("------");
      if (res.statusCode == 200) {
        for (int i = 0; i < json.decode(res.body).length; i++) {
          _cashedProducts[json.decode(res.body)[i]["id"]] = Product(
            id: json.decode(res.body)[i]["id"],
            name: json.decode(res.body)[i]["name"],
            price: json.decode(res.body)[i]["price"].toString(),
            images: new List<ProductImage>.generate(
                jsonDecode(res.body)[i]["images"].length, (image) {
              return ProductImage(
                  id: jsonDecode(res.body)[i]["images"][image]["id"],
                  name: jsonDecode(res.body)[i]["images"][image]["name"],
                  ext: jsonDecode(res.body)[i]["images"][image]["ext"],
                  size: jsonDecode(res.body)[i]["images"][image]["size"]
                      .toString(),
                  width: jsonDecode(res.body)[i]["images"][image]["width"]
                      .toString(),
                  height: jsonDecode(res.body)[i]["images"][image]["height"]
                      .toString(),
                  url: jsonDecode(res.body)[i]["images"][image]["url"],
                  thumbnailUrl: jsonDecode(res.body)[i]["images"][image]
                      ["formats"]["thumbnail"]["url"],
                  smallUrl: jsonDecode(res.body)[i]["images"][image]["formats"]
                      ["small"]["url"],
                  createdAt: jsonDecode(res.body)[i]["images"][image]
                      ["createdAt"]);
            }),
            category: json.decode(res.body)[i]["category"],
            desc: json.decode(res.body)[i]["desc"],
            features: json.decode(res.body)[i]["features"],
            createdAt: json.decode(res.body)[i]["createdAt"],
          );
        }
      }
    });
  }
}
