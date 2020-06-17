import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/gradientBanner.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/ui/theme/config.dart' as config;
import 'package:eco_commerce_app/main.dart' as main;

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading;
  List<Map<String, dynamic>> categoryData = [
    {
      "name": "Ceramics",
      "subcategory": ["Mugs", "Cups", "Bowls", "Spoons", "Forks", "Plates"],
      "icon": LineAwesomeIcons.spoon,
      "gradient": config.Colors().peachy
    },
    {
      "name": "Stationary",
      "subcategory": [
        "Pencils",
        "Papers",
        "Notebooks",
        "Pens",
        "Erasors",
        "Rulers"
      ],
      "icon": LineAwesomeIcons.pencil,
      "gradient": config.Colors().nebula
    },
    {
      "name": "Gifting Items",
      "subcategory": [
        "Table Lamps",
        "Picture Frames",
        "Gift Cards",
        "Cups",
        "Pen Holders",
        "Greeting Cards"
      ],
      "icon": LineAwesomeIcons.heart,
      "gradient": config.Colors().mildSeaRev
    },
    {
      "name": "Office Products",
      "subcategory": [
        "Calendar",
        "Sticky Notes",
        "Mousepads",
        "Staplers",
        "Notepads",
        "Diary",
        "Journals",
        "Organisers"
      ],
      "icon": LineAwesomeIcons.desktop,
      "gradient": config.Colors().deepSpace
    },
    {
      "name": "Furniture",
      "subcategory": ["Chairs", "Plants"],
      "icon": LineAwesomeIcons.paperclip,
      "gradient": config.Colors().disco
    },
    {
      "name": "Recyclables",
      "subcategory": ["Straws", "Plates", "Papers", "Handbags"],
      "icon": LineAwesomeIcons.recycle,
      "gradient": config.Colors().easyMed
    }
  ];

  void getData() async {
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      if (this.mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      key: _scaffoldKey,
      drawer: MainDrawer(),
      appBar: AppBar(
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
        title: Text(
          "Categories",
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
      body: isLoading
          ? LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
              backgroundColor: Color(0x6696EFA6),
            )
          : SingleChildScrollView(
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  GradientBanner(
                    gradient: config.Colors().aqua,
                    message:
                        "Welcome ${main.prefs.getString('username').toString().split(" ")[0]}, find the products you deserve!",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Wrap(
                      runSpacing: 30,
                      children: List.generate(categoryData.length, (index) {
                        String category = categoryData.elementAt(index)["name"];
                        List<String> subcategory =
                            categoryData.elementAt(index)["subcategory"];
                        IconData icon = categoryData.elementAt(index)["icon"];
                        LinearGradient gradient =
                            categoryData.elementAt(index)["gradient"];
                        return index.isEven
                            ? buildEvenCategory(
                                context, category, subcategory, icon, gradient)
                            : buildOddCategory(
                                context, category, subcategory, icon, gradient);
                      }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildEvenCategory(BuildContext context, String category,
      List<String> subcategory, IconData icon, LinearGradient gradient) {
    subcategory.shuffle();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 120,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.10),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ],
                    gradient: gradient),
                child: Column(
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Color(0xFFFFFFFF),
                      size: 40,
                    ),
                    SizedBox(height: 5),
                    Text(
                      category,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: -60,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: -60,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.10),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            constraints: BoxConstraints(minHeight: 120),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 5,
              children: List.generate(subcategory.length, (index) {
                String sub = subcategory.elementAt(index);
                return Material(
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [sub],
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.8)),
                      ),
                      child: Text(
                        sub,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOddCategory(BuildContext context, String category,
      List<String> subcategory, IconData icon, LinearGradient gradient) {
    subcategory.shuffle();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.10),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            constraints: BoxConstraints(minHeight: 120),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 5,
              children: List.generate(subcategory.length, (index) {
                String sub = subcategory.elementAt(index);
                return Material(
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CategoryRoute,
                        arguments: [sub],
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.8)),
                      ),
                      child: Text(
                        sub,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.10),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ],
                    gradient: gradient),
                child: Column(
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Color(0xFFFFFFFF),
                      size: 40,
                    ),
                    SizedBox(height: 5),
                    Text(
                      category,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: -60,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: -60,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
