import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/popUp.dart';
import 'package:eco_commerce_app/util/productLoderUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/util/multiListHandler.dart';

class HomeNew extends StatefulWidget {
  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  bool isLoading = true;
  bool isLoaded;
  List<Product> products;
  List<Widget> trending = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double height;
  double width;

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
        if (this.mounted) {
          setState(() {
            isLoading = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
            body: (products == null || isLoading == true)
                ? Container(
                    width: width,
                    child: LinearProgressIndicator(),
                  )
                : MultiListHandler(
                    height: height, width: width, products: products),
          ),
        );
      },
    );
  }
}
