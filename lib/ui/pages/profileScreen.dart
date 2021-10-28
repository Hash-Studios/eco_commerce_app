import 'dart:convert';

import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/popUp.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/main.dart' as main;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> orders = [];

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    String id = main.prefs.getString("id");
    // String jwt = main.prefs.getString("jwt");
    print(id);
    http
        .put(
      Uri.parse('https://ecocommerce.herokuapp.com/users/$id'),
    )
        .then((http.Response res) {
      print(json.decode(res.body));
      products = [];
      if (res.statusCode == 200) {
        for (int c = 0; c < json.decode(res.body)["products"].length; c++) {
          products.add(
            Product(
              id: json.decode(res.body)["products"][c]["id"],
              name: json.decode(res.body)["products"][c]["name"],
              price: json.decode(res.body)["products"][c]["price"].toString(),
              images: new List<ProductImage>.generate(
                  jsonDecode(res.body)["products"][c]["images"].length,
                  (image) {
                return ProductImage(
                    id: jsonDecode(res.body)["products"][c]["images"][image]
                        ["id"],
                    name: jsonDecode(res.body)["products"][c]["images"][image]
                        ["name"],
                    ext: jsonDecode(res.body)["products"][c]["images"][image]
                        ["ext"],
                    size: jsonDecode(res.body)["products"][c]["images"][image]["size"]
                        .toString(),
                    width: jsonDecode(res.body)["products"][c]["images"][image]
                            ["width"]
                        .toString(),
                    height: jsonDecode(res.body)["products"][c]["images"][image]
                            ["height"]
                        .toString(),
                    url: jsonDecode(res.body)["products"][c]["images"][image]
                        ["url"],
                    thumbnailUrl: jsonDecode(res.body)["products"][c]["images"]
                        [image]["formats"]["thumbnail"]["url"],
                    smallUrl: jsonDecode(res.body)["products"][c]["images"]
                        [image]["formats"]["small"]["url"],
                    createdAt: jsonDecode(res.body)["products"][c]["images"]
                        [image]["createdAt"]);
              }),
              category: json.decode(res.body)["products"][c]["category"],
              desc: json.decode(res.body)["products"][c]["desc"],
              features: json.decode(res.body)["products"][c]["features"],
              createdAt: json.decode(res.body)["products"][c]["createdAt"],
            ),
          );
        }
        if (this.mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  stretch: true,
                  backgroundColor: Colors.white,
                  excludeHeaderSemantics: true,
                  leading: Hero(
                    transitionOnUserGestures: true,
                    tag: 'menu',
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.black,
                        icon: Icon(LineAwesomeIcons.arrow_left),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Hero(
                      transitionOnUserGestures: true,
                      tag: 'bookmark',
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, WishListRoute);
                          },
                          color: Colors.black,
                          icon: Icon(LineAwesomeIcons.heart_o),
                        ),
                      ),
                    ),
                    Consumer<CurrentUser>(
                      builder: (_, currentUser, __) => IconButton(
                        onPressed: () {
                          popUpAlertDialog(
                              context: context,
                              text: "Are you sure want to log out?",
                              twoButtons: true,
                              func1: () {
                                Navigator.pop(context);
                                currentUser.deleteUser();
                                Navigator.pushReplacementNamed(
                                    context, SignUpLandingRoute);
                              },
                              button1text: "Yes",
                              func2: () {
                                Navigator.pop(context);
                              },
                              button2text: "No");
                        },
                        color: Colors.black,
                        icon: Icon(LineAwesomeIcons.sign_out),
                      ),
                    ),
                  ],
                  pinned: true,
                  floating: false,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * (2 / 5),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.fromLTRB(60, 0, 0, 13),
                    background: ProfileFlexibleAppBar(),
                    title: Container(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Your Orders",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              color: Color(0xff464646)),
                        )),
                  )),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
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
              ])),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileFlexibleAppBar extends StatefulWidget {
  const ProfileFlexibleAppBar();

  @override
  _ProfileFlexibleAppBarState createState() => _ProfileFlexibleAppBarState();
}

class _ProfileFlexibleAppBarState extends State<ProfileFlexibleAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<CurrentUser>(
            builder: (_, currentUser, __) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            left: 20, top: 0, right: 5, bottom: 4),
                        child: Text(
                          currentUser.username,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: width * 0.07,
                              color: Color(0xff464646)),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          currentUser.email,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: width * 0.032,
                              color: Color(0xff464646)),
                        )),
                    currentUser.phone == null || currentUser.phone == " "
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              currentUser.phone,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: width * 0.032,
                                  color: Color(0xff464646)),
                            )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          currentUser.organisation,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: width * 0.032,
                              color: Color(0xff464646)),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          currentUser.orgemail,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: width * 0.032,
                              color: Color(0xff464646)),
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: width * 0.2,
                        width: width * 0.2,
                        child: main.prefs.getString('googleimage') == null ||
                                main.prefs.getString('googleimage') == ""
                            ? CircleAvatar(
                                backgroundColor: Color(0xFFC4C4C4),
                                child: Text(
                                  globals.getInitials(currentUser.username),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFE0E0E0),
                                      fontSize: 30),
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                    main.prefs.getString("googleimage"))),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        print("Edit");
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: width * 0.05,
                              color: Color(0xff464646)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
