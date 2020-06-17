import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/util/productLoderUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_commerce_app/main.dart' as main;

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences sharedPreferences;
  List<Widget> list;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    list = new List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {
            print("Nav Drawer");
            _scaffoldKey.currentState.openDrawer();
          },
          color: Colors.black,
          icon: Icon(LineAwesomeIcons.navicon),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Search");
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.search),
          ),
          IconButton(
            onPressed: () {
              print("Bookmark");
            },
            color: Colors.black,
            icon: Icon(LineAwesomeIcons.bookmark),
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Consumer<WishlistProvider>(builder: (_, wishlist, __) {
          wishlist.updateWishList();
          return ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                child: Text(
                  'WishList',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              (wishlist.wishListedProducts == null || isLoading == true)
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Builder(
                        builder: (context) {
                          for (int index = 0;
                              index < wishlist.wishListedProducts.length;
                              index++) {
                            list.add(ProductListTileDynamic(arguements: [
                              wishlist.wishListedProducts[index]
                            ]));
                          }
                          return Column(children: list);
                        },
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}

class WishlistProvider extends ChangeNotifier {
  List<Product> wishListedProducts = [];
  bool isWishListed = false;
  updateWishList() async {
    List<String> listTemp =
        (main.prefs.getStringList('wishListPref') ?? List<String>());
    for (int i = 0; i < listTemp.length; i++) {
      await new Future<Product>(() {
        return ProductLoader.loadProductById(listTemp[i]);
      }).then((value) {
        this.wishListedProducts.add(value);
        print(value.name);
      });
    }
    notifyListeners();
  }

  checkWishList(String id, bool update) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishList =
        (prefs.getStringList('wishListPref') ?? List<String>());

    if (!update) {
      wishList.contains(id)
          ? this.isWishListed = true
          : this.isWishListed = false;
    } else {
      wishList.contains(id) ? wishList.remove(id) : wishList.add(id);
      await prefs.setStringList('wishListPref', wishList);
    }
  }
}
