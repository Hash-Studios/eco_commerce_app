import 'package:eco_commerce_app/ui/widgets/productListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SearchScreen extends StatelessWidget {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController searchController = TextEditingController();
  final List<String> searchQuery = [
    'Stationery',
    'Mug',
    'Cup',
    'Plants',
    'Stationery',
    'Mug',
    'Cup',
    'Plants',
    'Lorem Ipsum Lorem',
    'Lorem Ipsum Lorem'
  ];
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
        leading: Hero(
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                width: width * 0.67,
                child: TextFormField(
                  controller: searchController,
                  focusNode: _searchFocus,
                  onFieldSubmitted: (term) {
                    _searchFocus.unfocus();
                  },
                  textInputAction: TextInputAction.next,
                  cursorColor: Color(0xFF000000),
                  cursorRadius: Radius.circular(8),
                  cursorWidth: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(color: Color(0xFF000000), width: 2),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(color: Color(0xFF000000), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(color: Color(0xFF004445), width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(color: Color(0xFFFF0000), width: 2),
                    ),
                    errorText: null,
                    hintText: "Search",
                    labelText: "Search for products",
                    labelStyle: TextStyle(
                      color: Color(0xFF000000),
                    ),
                    suffixIcon: Hero(
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
          ],
        ),
        actions: <Widget>[
          Hero(
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
        ],
        bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchQuery.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SearchChip(
                        label: searchQuery[index],
                        searchController: searchController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size(width * 1, height * 0.06)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
              ProductListTile(),
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
        onPressed: () {
          searchController.text = label;
        },
        label: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF004445),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1,
            color: Color(0xFF004445),
          ),
        ),
      ),
    );
  }
}
