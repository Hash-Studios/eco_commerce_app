import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/mainDrawer.dart';
import 'package:eco_commerce_app/ui/widgets/sectionHeader.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> categoryData = [
    {
      "name": "Ceramics",
      "subcategory": ["Mugs", "Cups", "Bowls", "Spoons", "Forks", "Plates"],
      "icon": LineAwesomeIcons.spoon
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
      "icon": LineAwesomeIcons.pencil
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
      "icon": LineAwesomeIcons.heart
    },
    {
      "name": "Office Products",
      "subcategory": [
        "Calendar",
        "Sticky Notes",
        "Mousepads",
        "Staplers",
        "Diary",
        "Journals",
        "Organisers"
      ],
      "icon": LineAwesomeIcons.desktop
    },
    {
      "name": "Furniture",
      "subcategory": ["Chairs", "Plants"],
      "icon": LineAwesomeIcons.paperclip
    },
    {
      "name": "Recyclables",
      "subcategory": ["Straws", "Plates", "Papers", "Handbags"],
      "icon": LineAwesomeIcons.recycle
    }
  ];

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
        leading: Hero(
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
          Hero(
            tag: 'bookmark',
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  print("Bookmark");
                },
                color: Colors.black,
                icon: Icon(LineAwesomeIcons.bookmark),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(
          runSpacing: 20,
          children: <Widget>[
            SectionHeader(text: "Categories"),
            Wrap(
              runSpacing: 30,
              children: List.generate(categoryData.length, (index) {
                String category = categoryData.elementAt(index)["name"];
                List<String> subcategory =
                    categoryData.elementAt(index)["subcategory"];
                IconData icon = categoryData.elementAt(index)["icon"];
                return index.isEven
                    ? buildEvenCategory(context, category, subcategory, icon)
                    : buildOddCategory(context, category, subcategory, icon);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEvenCategory(BuildContext context, String category,
      List<String> subcategory, IconData icon) {
    subcategory.shuffle();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 120,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).accentColor.withOpacity(0.2),
                        ])),
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: category,
                      child: Icon(
                        icon,
                        color: Color(0xFFFFFFFF),
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      category,
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Poppins",
                          fontSize: 14),
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
                        style: TextStyle(
                            color: Color(0xFF004445),
                            fontFamily: "Poppins",
                            fontSize: 10),
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
      List<String> subcategory, IconData icon) {
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
                        style: TextStyle(
                            color: Color(0xFF004445),
                            fontFamily: "Poppins",
                            fontSize: 10),
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
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).accentColor.withOpacity(0.2),
                        ])),
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: category,
                      child: Icon(
                        icon,
                        color: Color(0xFFFFFFFF),
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      category,
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Poppins",
                          fontSize: 14),
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
