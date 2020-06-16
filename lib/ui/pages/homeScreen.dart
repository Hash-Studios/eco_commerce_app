import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/categoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/gradientBanner.dart';
import 'package:eco_commerce_app/ui/widgets/landingSlider.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/popUp.dart';
import 'package:eco_commerce_app/ui/widgets/popularSlider.dart';
import 'package:eco_commerce_app/ui/widgets/productCardSlider.dart';
import 'package:eco_commerce_app/ui/widgets/productGridTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/ui/widgets/secondaryCategoryButton.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:eco_commerce_app/ui/widgets/textSlider.dart';
import 'package:eco_commerce_app/ui/widgets/trendingSlider.dart';
import 'package:eco_commerce_app/util/productLoderUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/main.dart' as main;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> trending = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//  void getData() async {
//    setState(() {
//      isLoading = true;
//    });
  //    http
//        .get(
//      'https://ecocommerce.herokuapp.com/products',
//    )
//        .then((http.Response res) {
//      print(json.decode(res.body));
//      products = [];
//      if (res.statusCode == 200) {
//        for (int c = 0; c < json.decode(res.body).length; c++) {
//          products.add(
//            Product(
//              id: json.decode(res.body)[c]["id"],
//              name: json.decode(res.body)[c]["name"],
//              price: json.decode(res.body)[c]["price"].toString(),
//              images: new List<ProductImage>.generate(
//                  jsonDecode(res.body)[c]["images"].length, (image) {
//                return ProductImage(
//                    id: jsonDecode(res.body)[c]["images"][image]["id"],
//                    name: jsonDecode(res.body)[c]["images"][image]["name"],
//                    ext: jsonDecode(res.body)[c]["images"][image]["ext"],
//                    size: jsonDecode(res.body)[c]["images"][image]["size"]
//                        .toString(),
//                    width: jsonDecode(res.body)[c]["images"][image]["width"]
//                        .toString(),
//                    height: jsonDecode(res.body)[c]["images"][image]["height"]
//                        .toString(),
//                    url: jsonDecode(res.body)[c]["images"][image]["url"],
//                    thumbnailUrl: jsonDecode(res.body)[c]["images"][image]
//                        ["formats"]["thumbnail"]["url"],
//                    smallUrl: jsonDecode(res.body)[c]["images"][image]
//                        ["formats"]["small"]["url"],
//                    createdAt: jsonDecode(res.body)[c]["images"][image]
//                        ["createdAt"]);
//              }),
//              category: json.decode(res.body)[c]["category"],
//              desc: json.decode(res.body)[c]["desc"],
//              features: json.decode(res.body)[c]["features"],
//              createdAt: json.decode(res.body)[c]["createdAt"],
//            ),
//          );
//        }
//        setState(() {
//          isLoading = false;
//        });
//      }
//    });
//  }

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    isLoading = true;
    products = new List();
    new Future<List<Product>>(() {
      return ProductLoader.loadProducts();
    }).then((value) {
      setState(() {
        products = value;
        print(value);
        isLoading = false;
      });
    });
//    getData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<CurrentUser>(
      builder: (_, currentUser, __) {
        currentUser.getUserfromSP();
        return WillPopScope(
          onWillPop: () async {
            popUpAlertDialog(
                context: context,
                func1: () {
                  SystemChannels.platform.invokeMethod("SystemNavigator.pop");
                },
                button1text: "Yes",
                button2text: "No",
                twoButtons: true,
                text: "Do you want to exit?",
                func2: () {
                  Navigator.pop(context);
                });
            return false;
          },
          child: Scaffold(
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
                      print("Nav Drawer");
                      _scaffoldKey.currentState.openDrawer();
                    },
                    color: Colors.black,
                    icon: Icon(LineAwesomeIcons.navicon),
                  ),
                ),
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
                        print("Search");
                        Navigator.pushNamed(context, SearchRoute);
                      },
                      color: Colors.black,
                      icon: Icon(LineAwesomeIcons.search),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            drawer: MainDrawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  (products == null || isLoading == true)
                      ? LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                          backgroundColor: Color(0x6696EFA6),
                        )
                      : Container(),
                  LandingSlider(),
                  SectionHeader(
                    text: "Popular Now",
                  ),
                  PopularSlider(),
                  GradientBanner(
                      gradient: config.Colors().alive,
                      message:
                          "Find the greatest collection of Natural Products!"),
                  (products == null || isLoading == true)
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: config.Colors().alive,
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
                    gradient: config.Colors().peachy,
                    message:
                        "While you are here ${main.prefs.getString('username').toString().split(" ")[0]}, do check these amazing offers!",
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: config.Colors().peachy,
                    ),
                    child: PopularSlider(),
                  ),
                  SectionHeader(
                    text: "Categories",
                  ),
                  Container(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CategoryButton(
                          width: width,
                          text: "Cups",
                          image: "assets/icons/cup.png",
                          function: () {
                            Navigator.pushNamed(
                              context,
                              CategoryRoute,
                              arguments: ["Cups"],
                            );
                          },
                        ),
                        CategoryButton(
                          width: width,
                          text: "Pens",
                          image: "assets/icons/pen.png",
                          function: () {
                            Navigator.pushNamed(
                              context,
                              CategoryRoute,
                              arguments: ["Pens"],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CategoryButton(
                          width: width,
                          text: "Plants",
                          image: "assets/icons/plant.png",
                          function: () {
                            Navigator.pushNamed(
                              context,
                              CategoryRoute,
                              arguments: ["Plants"],
                            );
                          },
                        ),
                        CategoryButton(
                          width: width,
                          text: "Masks",
                          image: "assets/icons/mask.png",
                          function: () {
                            Navigator.pushNamed(
                              context,
                              CategoryRoute,
                              arguments: ["Masks"],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CategoryButton(
                          width: width,
                          text: "Paper",
                          image: "assets/icons/paper.png",
                          function: () {
                            Navigator.pushNamed(
                              context,
                              CategoryRoute,
                              arguments: ["Paper"],
                            );
                          },
                        ),
                        SecondaryCategoryButton(
                          width: width,
                          text: "See All",
                          function: () {
                            Navigator.pushNamed(context, CategoriesRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: SectionHeader(text: "Trending Products")),
                  (products == null || isLoading == true)
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Builder(
                            builder: (context) {
                              trending = [];
                              for (int index = 8; index < 13; index++) {
                                trending.add(ProductListTileDynamic(
                                    arguements: [products[index]]));
                              }
                              return Column(children: trending);
                            },
                          ),
                        ),
                  GradientBanner(
                      gradient: config.Colors().aqua,
                      message:
                          "Find the greatest collection of Natural Products!"),
                  (products == null || isLoading == true)
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: config.Colors().aqua,
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
                                    arguements: [products[index + 4]]);
                              }),
                        ),
                  Stack(
                    children: <Widget>[
                      TrendingSlider(),
                      TextSlider(),
                    ],
                  ),
                  Center(child: SectionHeader(text: "Trending Products")),
                  (products == null || isLoading == true)
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Builder(
                            builder: (context) {
                              trending = [];
                              for (int index = 13;
                                  index < products.length;
                                  index++) {
                                trending.add(ProductListTileDynamic(
                                    arguements: [products[index]]));
                              }
                              return Column(children: trending);
                            },
                          ),
                        ),
                  SectionHeader(text: "Disposables"),
                  ProductCardsSlider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
