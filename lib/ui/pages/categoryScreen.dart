import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/gradientBanner.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productGridTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class CategoryScreen extends StatefulWidget {
  final List<String> arguements;
  CategoryScreen({this.arguements});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String categoryName;
  String categoryId;
  List<Product> products;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static List response = [
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
      "users": ["5ee94f48fdf1dd0017fac529"],
      "_id": "5ee2904cf2e2d8224311edde",
      "reviews": null,
      "name": "White Ceramic Mug",
      "price": 250,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum ligula in lorem interdum, eu suscipit ex malesuada. Donec consequat fringilla tincidunt. Praesent porttitor finibus lorem a dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ultricies est ac mi volutpat, in imperdiet lacus blandit. Nullam a dapibus nisi. Cras suscipit velit eget nisl cursus, mattis dapibus diam rutrum. Praesent vulputate elit at odio lacinia, at lacinia ipsum commodo. Nunc pellentesque, eros ut vulputate dapibus, velit neque eleifend tellus, ac suscipit elit velit id mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque accumsan metus ut lorem porta, fermentum aliquam enim auctor. Aenean vel nisl velit. Nunc est elit, luctus ac feugiat eu, iaculis vitae ligula. Vestibulum vestibulum purus vitae dui mattis hendrerit.",
      "rating": null,
      "createdAt": "2020-06-11T20:13:00.730Z",
      "updatedAt": "2020-06-17T22:25:27.838Z",
      "__v": 0,
      "tags": "mug,white mug,ceramic,crockery",
      "id": "5ee2904cf2e2d8224311edde"
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
      "users": [],
      "_id": "5ee934e3fdf1dd0017fac521",
      "reviews": null,
      "name": "The Champ Mug",
      "price": 999,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:08:51.112Z",
      "updatedAt": "2020-06-17T20:34:03.568Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic",
      "id": "5ee934e3fdf1dd0017fac521"
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
      "users": [],
      "_id": "5ee93502fdf1dd0017fac523",
      "reviews": null,
      "name": "Red Mug",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "price": 250,
      "createdAt": "2020-06-16T21:09:22.148Z",
      "updatedAt": "2020-06-17T20:34:42.690Z",
      "__v": 0,
      "tags": "mug,red mug,white mug,red,utensils,ceramic,crockery,coffee",
      "id": "5ee93502fdf1dd0017fac523"
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
      "users": [],
      "_id": "5ee93588fdf1dd0017fac525",
      "reviews": null,
      "name": "Brown Mug",
      "price": 245,
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "features":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla rhoncus mollis sapien at condimentum. Aliquam ullamcorper odio ac velit mattis tristique. Sed ac turpis rhoncus, rutrum augue posuere, varius odio. Aliquam vehicula mauris id leo accumsan, sit amet consequat libero fermentum. Praesent finibus, mi eu ultricies bibendum, lorem ex rutrum felis, a finibus enim elit eu ipsum. Sed sed justo sagittis, feugiat ante at, posuere dui. In non lacus ullamcorper elit hendrerit dictum et nec mi. Cras congue auctor velit, vitae gravida massa fermentum a. Mauris dictum, ligula a volutpat faucibus, turpis justo faucibus neque, vitae vestibulum orci magna sit amet nulla. Maecenas cursus iaculis varius. Morbi vel nibh iaculis, tincidunt nibh vitae, eleifend mi.",
      "createdAt": "2020-06-16T21:11:36.282Z",
      "updatedAt": "2020-06-17T20:35:49.980Z",
      "__v": 0,
      "tags": "coffee mug,coffee,mug,crockery,ceramic,utensils,red,brown,tea",
      "id": "5ee93588fdf1dd0017fac525"
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
          category: widget.arguements[0],
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
    categoryName = widget.arguements[0];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: Hero(
          transitionOnUserGestures: true,
          tag: 'menu',
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              color: Colors.black,
              icon: Icon(LineAwesomeIcons.navicon),
            ),
          ),
        ),
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: <Widget>[
          Hero(
            transitionOnUserGestures: true,
            tag: 'search',
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchRoute);
                },
                color: Colors.black,
                icon: Icon(LineAwesomeIcons.search),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFFFFF),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isLoading
                ? LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                    backgroundColor: Color(0x6696EFA6),
                  )
                : Column(
                    children: <Widget>[
                      GradientBanner(
                          gradient: config.Colors().nebula,
                          message:
                              "Find the greatest collection of $categoryName! All! Evertything!"),
                      Container(
                        decoration: BoxDecoration(
                          gradient: config.Colors().nebula,
                        ),
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.58,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return ProductGridTileDynamic(
                                  arguements: [products[index]]);
                            }),
                      ),
                      GradientBanner(
                          gradient: config.Colors().nebula,
                          message: "Your quest for $categoryName ends here!"),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length - 4,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          itemBuilder: (context, index) {
                            return ProductListTileDynamic(
                                arguements: [products[index + 4]]);
                          }),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
