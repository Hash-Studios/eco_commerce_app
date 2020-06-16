import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:eco_commerce_app/util/productLoderUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences sharedPreferences;
  String prefWishList;
  List<Product> wishListedProducts;
  List<Widget> list;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishListedProducts = new List();
    list = new List();
    prefWishList = 'wishListPref';
    updateWishList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
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
          child: ListView(
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
              (wishListedProducts == null || isLoading == true)
                  ? Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Builder(
                        builder: (context) {
                          for (int index = 0;
                              index < wishListedProducts.length;
                              index++) {
                            list.add(ProductListTileDynamic(
                                arguements: [wishListedProducts[index]]));
                          }
                          return Column(children: list);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  updateWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listTemp =
        (prefs.getStringList(prefWishList) ?? List<String>());
        for(int i=0;i<listTemp.length;i++)
       {
         new Future<Product>((){
           return  ProductLoader.loadProductById(listTemp[i]);
         }).then((value) {
             wishListedProducts.add(value);
             print(value);
         });
        }
       setState(() {
         isLoading = false;
       });

  }
}
