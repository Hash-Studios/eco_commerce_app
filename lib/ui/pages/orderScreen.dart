import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/ui/widgets/appBarTitle.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> orders = [];
  static List response = [
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edcb",
          "name": "pencils",
          "alternativeText": "",
          "caption": "",
          "hash": "pencils_324a6c3a62",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 39.71,
          "width": 640,
          "height": 427,
          "url": "/uploads/pencils_324a6c3a62.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_pencils_324a6c3a62",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 9.16,
              "path": null,
              "url": "/uploads/thumbnail_pencils_324a6c3a62.jpeg"
            },
            "small": {
              "hash": "small_pencils_324a6c3a62",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 27.71,
              "path": null,
              "url": "/uploads/small_pencils_324a6c3a62.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee29090f2e2d8224311ede2"],
          "createdAt": "2020-06-11T20:09:25.382Z",
          "updatedAt": "2020-06-11T20:14:08.619Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edcb"
        }
      ],
      "users": ["5ee68d6e6465270017589fe4"],
      "_id": "5ee29090f2e2d8224311ede2",
      "reviews": null,
      "name": "Color Pencils (Set of 24)",
      "price": 120,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:14:08.379Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "colour,pencils,sketch,art,color,pens",
      "id": "5ee29090f2e2d8224311ede2"
    },
    {
      "images": [
        {
          "_id": "5ee28f73f2e2d8224311edc1",
          "name": "erasers",
          "alternativeText": "",
          "caption": "",
          "hash": "erasers_8e801c102b",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 15.44,
          "width": 640,
          "height": 427,
          "url": "/uploads/erasers_8e801c102b.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 234,
              "height": 156,
              "size": 3.66,
              "path": null,
              "url": "/uploads/thumbnail_erasers_8e801c102b.jpeg"
            },
            "small": {
              "hash": "small_erasers_8e801c102b",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 334,
              "size": 10.9,
              "path": null,
              "url": "/uploads/small_erasers_8e801c102b.jpeg"
            }
          },
          "provider": "local",
          "related": ["5ee290d2f2e2d8224311ede6", "5ee935c3fdf1dd0017fac527"],
          "createdAt": "2020-06-11T20:09:23.880Z",
          "updatedAt": "2020-06-16T21:12:36.335Z",
          "__v": 0,
          "id": "5ee28f73f2e2d8224311edc1"
        }
      ],
      "users": ["5ee68d6e6465270017589fe4"],
      "_id": "5ee290d2f2e2d8224311ede6",
      "reviews": null,
      "name": "Blue Eraser (Large)",
      "price": 10,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "createdAt": "2020-06-11T20:15:14.929Z",
      "updatedAt": "2020-06-17T22:24:45.888Z",
      "__v": 0,
      "tags": "rubber,eraser,blue,red,pencil",
      "id": "5ee290d2f2e2d8224311ede6"
    },
    {
      "images": [
        {
          "_id": "5ee28f75f2e2d8224311edc9",
          "name": "mugs",
          "alternativeText": "",
          "caption": "",
          "hash": "mugs_eb94d10351",
          "ext": ".jpeg",
          "mime": "image/jpeg",
          "size": 30.77,
          "width": 640,
          "height": 512,
          "url": "/uploads/mugs_eb94d10351.jpeg",
          "formats": {
            "thumbnail": {
              "hash": "thumbnail_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 195,
              "height": 156,
              "size": 4.73,
              "path": null,
              "url": "/uploads/thumbnail_mugs_eb94d10351.jpeg"
            },
            "small": {
              "hash": "small_mugs_eb94d10351",
              "ext": ".jpeg",
              "mime": "image/jpeg",
              "width": 500,
              "height": 400,
              "size": 20.94,
              "path": null,
              "url": "/uploads/small_mugs_eb94d10351.jpeg"
            }
          },
          "provider": "local",
          "related": [
            "5ee2904cf2e2d8224311edde",
            "5ee509920e493c0017e05563",
            "5ee934e3fdf1dd0017fac521",
            "5ee93502fdf1dd0017fac523",
            "5ee93588fdf1dd0017fac525"
          ],
          "createdAt": "2020-06-11T20:09:25.229Z",
          "updatedAt": "2020-06-16T21:11:36.848Z",
          "__v": 0,
          "id": "5ee28f75f2e2d8224311edc9"
        }
      ],
      "users": ["5ee68d6e6465270017589fe4"],
      "_id": "5ee509920e493c0017e05563",
      "reviews": null,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "name": "Coffee Mug Set",
      "price": 599,
      "createdAt": "2020-06-13T17:14:58.835Z",
      "updatedAt": "2020-06-17T20:30:31.967Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic",
      "id": "5ee509920e493c0017e05563"
    }
  ];
  void getData() async {
    setState(() {
      isLoading = true;
    });
    products = [];
    for (int c = 0; c < response.length; c++) {
      products.add(
        Product(
          id: response[c]["id"],
          name: response[c]["name"],
          price: response[c]["price"].toString(),
          images: new List<ProductImage>.generate(response[c]["images"].length,
              (image) {
            return ProductImage(
                id: response[c]["images"][image]["id"],
                name: response[c]["images"][image]["name"],
                ext: response[c]["images"][image]["ext"],
                size: response[c]["images"][image]["size"].toString(),
                width: response[c]["images"][image]["width"].toString(),
                height: response[c]["images"][image]["height"].toString(),
                url: response[c]["images"][image]["url"],
                thumbnailUrl: response[c]["images"][image]["formats"]
                    ["thumbnail"]["url"],
                smallUrl: response[c]["images"][image]["formats"]["small"]
                    ["url"],
                createdAt: response[c]["images"][image]["createdAt"]);
          }),
          category: response[c]["category"],
          desc: response[c]["desc"],
          features: response[c]["features"],
          createdAt: response[c]["createdAt"],
        ),
      );
    }
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUser>(
      builder: (_, currentUser, __) {
        currentUser.getUserfromSP();
        return Scaffold(
          appBar: AppBar(
            title: AppBarTitle(text: "Orders"),
            elevation: 0,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.white,
          drawer: MainDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isLoading
                    ? LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                        backgroundColor: Color(0x6696EFA6),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Builder(
                          builder: (context) {
                            orders = [];
                            for (int index = 0;
                                index < products.length;
                                index++) {
                              orders.add(ProductListTileDynamic(
                                  arguements: [products[index]]));
                            }
                            return Column(children: orders);
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
