import 'dart:collection';
import 'dart:convert';
import 'package:eco_commerce_app/core/model/image.dart';
import 'package:eco_commerce_app/core/model/product.dart';
import 'package:eco_commerce_app/ui/widgets/productListTileDynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

final GlobalKey<FormState> formSearch = GlobalKey<FormState>();

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final FocusNode _searchFocus = FocusNode();
  bool isFocussed;
  bool isNull;
  bool isLoading;
  bool sortPrice;
  bool sortName;
  List<Product> products;
  ScrollController scrollController;
  bool dialVisible = true;
  final TextEditingController searchController = TextEditingController();
  var refreshKey2 = GlobalKey<RefreshIndicatorState>();
  List<String> searchQuery = [];

  List<dynamic> tags = [];

  @override
  void initState() {
    isFocussed = false;
    isLoading = false;
    isNull = true;
    sortName = false;
    sortPrice = true;
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void toggleSort() {
    setState(() {
      sortName = !sortName;
      sortPrice = !sortPrice;
    });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  void getData(String query) async {
    String sorting;
    String search = "";
    setState(() {
      isLoading = true;
      isNull = false;
    });
    if (sortPrice) {
      setState(() {
        sorting = "&_sort=price:ASC";
      });
    } else if (sortName) {
      setState(() {
        sorting = "&_sort=name:ASC";
      });
    } else {
      setState(() {
        sorting = "";
      });
    }
    for (int q = 0; q < query.split(" ").length; q++) {
      if (q > 0) {
        search = search + "&";
      }
      search = search + "name_contains=${query.split(" ")[q]}";
    }
    http
        .get(Uri.parse(
      'https://ecocommerce.herokuapp.com/products?$search$sorting'),
    )
        .then((http.Response response) {
      if (response.statusCode == 200) {
        searchQuery = [];
        tags = [];
        products = [];
        print(response.body);
        if (response.statusCode == 200) {
          for (int c = 0; c < json.decode(response.body).length; c++) {
            products.add(
              Product(
                id: json.decode(response.body)[c]["id"],
                name: json.decode(response.body)[c]["name"],
                price: json.decode(response.body)[c]["price"].toString(),
                images: new List<ProductImage>.generate(
                    jsonDecode(response.body)[c]["images"].length, (image) {
                  return ProductImage(
                      id: jsonDecode(response.body)[c]["images"][image]["id"],
                      name: jsonDecode(response.body)[c]["images"][image]
                          ["name"],
                      ext: jsonDecode(response.body)[c]["images"][image]["ext"],
                      size: jsonDecode(response.body)[c]["images"][image]
                              ["size"]
                          .toString(),
                      width: jsonDecode(response.body)[c]["images"][image]
                              ["width"]
                          .toString(),
                      height: jsonDecode(response.body)[c]["images"][image]
                              ["height"]
                          .toString(),
                      url: jsonDecode(response.body)[c]["images"][image]["url"],
                      thumbnailUrl: jsonDecode(response.body)[c]["images"]
                          [image]["formats"]["thumbnail"]["url"],
                      smallUrl: jsonDecode(response.body)[c]["images"][image]
                          ["formats"]["small"]["url"],
                      createdAt: jsonDecode(response.body)[c]["images"][image]
                          ["createdAt"]);
                }),
                category: json.decode(response.body)[c]["categories"][0]
                    ["name"],
                desc: json.decode(response.body)[c]["desc"],
                features: json.decode(response.body)[c]["features"],
                createdAt: json.decode(response.body)[c]["createdAt"],
              ),
            );
            searchQuery.add(json
                .decode(response.body)[c]["categories"][0]["name"]
                .toString());
            searchQuery =
                searchQuery + json.decode(response.body)[c]["tags"].split(",");
          }
          if (this.mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      }
      var map = Map();

      searchQuery.forEach((element) {
        if (!map.containsKey(element)) {
          map[element] = 1;
        } else {
          map[element] += 1;
        }
      });

      var sortedKeys = map.keys.toList(growable: false)
        ..sort((k1, k2) => map[k1].compareTo(map[k2]));
      LinkedHashMap sortedMap = new LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => map[k]);
      tags = List.from(sortedMap.keys.toList().reversed);
      if (tags.contains(searchController.text.toLowerCase())) {
        tags.removeAt(tags.indexOf(searchController.text.toLowerCase()));
        tags.insert(0, searchController.text.toLowerCase());
      }
    });
  }

  Future<Null> refreshList() async {
    refreshKey2.currentState?.show(atTop: true);
    await Future.delayed(Duration(milliseconds: 500));
    getData(searchController.text);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              firstChild: Hero(
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
              secondChild: Container(),
              crossFadeState: isFocussed
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isFocussed ? width * 0.86 : width * 0.6,
                child: Form(
                  key: formSearch,
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black,
                        ),
                    onTap: () {
                      setState(() {
                        isFocussed = true;
                      });
                    },
                    onChanged: (text) {
                      // getData(text);
                    },
                    onSaved: (text) {
                      getData(text);
                    },
                    controller: searchController,
                    focusNode: _searchFocus,
                    onFieldSubmitted: (term) {
                      _searchFocus.unfocus();
                      getData(term);
                      setState(() {
                        isFocussed = false;
                      });
                    },
                    textInputAction: TextInputAction.search,
                    cursorColor: Color(0xFF000000),
                    cursorRadius: Radius.circular(8),
                    cursorWidth: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 1),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Color(0xFF004445), width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Color(0xFFFF0000), width: 1),
                      ),
                      errorText: null,
                      hintText: "Search",
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: Color(0xFF000000),
                      ),
                      suffixIcon: Hero(
                        transitionOnUserGestures: true,
                        tag: 'bookmark',
                        child: Card(
                          margin: EdgeInsets.all(0),
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: IconButton(
                              icon: Icon(
                                LineAwesomeIcons.close,
                                color: Color(0xFF000000),
                              ),
                              onPressed: () {
                                searchController.text = "";
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    expands: false,
                    inputFormatters: [
                      BlacklistingTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
              ),
            ),
            Spacer(),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              firstChild: Hero(
                transitionOnUserGestures: true,
                tag: 'search',
                child: Card(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  elevation: 0,
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      LineAwesomeIcons.search,
                      color: Color(0xFF000000),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              secondChild: Container(),
              crossFadeState: isFocussed
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            )
          ],
        ),
        bottom: tags.length != 0
            ? PreferredSize(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.06,
                      width: width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tags.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SearchChip(
                            label: tags[index],
                            searchController: searchController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                preferredSize: Size(width * 1, height * 0.06))
            : null,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        visible: dialVisible,
        curve: Curves.bounceIn,
        children: [
          sortName
              ? SpeedDialChild(
                  child: Icon(Icons.attach_money, color: Colors.white),
                  backgroundColor: Colors.teal[300],
                  onTap: () {
                    toggleSort();
                    getData(searchController.text);
                  },
                  label: 'Sort by price',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500),
                  labelBackgroundColor: Colors.teal[300],
                )
              : SpeedDialChild(
                  child: Icon(Icons.sort_by_alpha, color: Colors.white),
                  backgroundColor: Colors.teal[300],
                  onTap: () {
                    toggleSort();
                    getData(searchController.text);
                  },
                  label: 'Sort by name',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500),
                  labelBackgroundColor: Colors.teal[300],
                ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              isNull
                  ? Container()
                  : isLoading
                      ? LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color(0xFF96EFA6)),
                          backgroundColor: Color(0x6696EFA6),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: products.length,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          itemBuilder: (context, index) {
                            return ProductListTileDynamic(
                                arguements: [products[index]]);
                          })
            ],
          ),
        ),
      ),
    );
  }
}

class SearchChip extends StatelessWidget {
  final String label;
  final TextEditingController searchController;
  const SearchChip({
    this.label,
    this.searchController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: ActionChip(
        avatar: searchController.text.toLowerCase() == label
            ? Icon(Icons.check)
            : null,
        onPressed: () {
          searchController.text = label;
          formSearch.currentState.save();
        },
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        backgroundColor: searchController.text.toLowerCase() == label
            ? Theme.of(context).accentColor
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(500),
          side: BorderSide(
            width: 1,
            color: Color(0xFF004445),
          ),
        ),
      ),
    );
  }
}
