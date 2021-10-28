import 'dart:collection';
import 'dart:convert';

import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/main.dart';
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
      Uri.parse('https://ecocommerce.herokuapp.com/products' +
          ((id != null) ? '/' + id : "")),
    )
        .then((http.Response res) {
      String response = res.body.toString();
      if (id != null) response = '[' + response + ']';

      print(json.decode(response));

      if (res.statusCode == 200) {
        for (int i = 0; i < json.decode(response).length; i++) {
          _cashedProducts[json.decode(response)[i]["id"]] = Product(
            id: json.decode(response)[i]["id"],
            name: json.decode(response)[i]["name"],
            price: json.decode(response)[i]["price"].toString(),
            images: new List<ProductImage>.generate(
                jsonDecode(response)[i]["images"].length, (image) {
              return ProductImage(
                  id: jsonDecode(response)[i]["images"][image]["id"],
                  name: jsonDecode(response)[i]["images"][image]["name"],
                  ext: jsonDecode(response)[i]["images"][image]["ext"],
                  size: jsonDecode(response)[i]["images"][image]["size"]
                      .toString(),
                  width: jsonDecode(response)[i]["images"][image]["width"]
                      .toString(),
                  height: jsonDecode(response)[i]["images"][image]["height"]
                      .toString(),
                  url: jsonDecode(response)[i]["images"][image]["url"],
                  thumbnailUrl: jsonDecode(response)[i]["images"][image]
                      ["formats"]["thumbnail"]["url"],
                  smallUrl: jsonDecode(response)[i]["images"][image]["formats"]
                      ["small"]["url"],
                  createdAt: jsonDecode(response)[i]["images"][image]
                      ["createdAt"]);
            }),
            category: json.decode(response)[i]["categories"][0]["name"],
            desc: json.decode(response)[i]["desc"],
            features: json.decode(response)[i]["features"],
            createdAt: json.decode(response)[i]["createdAt"],
          );
        }
      }
    });
  }
}
