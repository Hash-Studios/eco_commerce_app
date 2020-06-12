import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SearchScreen extends StatelessWidget {
  final FocusNode _searchFocus = FocusNode();
  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> res;
  List<String> searchQuery = [
    'Stationery',
    'Mug',
    'Cup',
    'Plants',
    'Lorem Ipsum Lorem',
    'Stationery',
    'Mug',
    'Cup',
    'Plants',
    'Lorem Ipsum Lorem'
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 5, 5),
                      child: Container(
                        width: width * 0.7,
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
                              borderSide: BorderSide(
                                  color: Color(0xFF000000), width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color: Color(0xFF000000), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color: Color(0xFF044455), width: 2),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  color: Color(0xFFFF0000), width: 2),
                            ),
                            errorText: null,
                            hintText: "Search",
                            labelText: "Search for products",
                            labelStyle: TextStyle(
                              color: Color(0xFF000000),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Icon(
                                LineAwesomeIcons.search,
                                color: Color(0xFF000000),
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
                    FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.08,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchQuery.length,
                    itemBuilder: (context, index) => SearchChip(
                      label: searchQuery[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchChip extends StatelessWidget {
  final String label;
  const SearchChip({
    this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: ActionChip(
        onPressed: () {},
        label: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF044455),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1,
            color: Color(0xFF044455),
          ),
        ),
      ),
    );
  }
}
