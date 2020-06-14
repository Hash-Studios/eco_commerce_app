import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:eco_commerce_app/core/model/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/popUp.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:eco_commerce_app/globals.dart' as globals;
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHeader(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  child: Consumer<CurrentUser>(
                    builder: (_, currentUser, __) => UserAccountsDrawerHeader(
                      arrowColor: Colors.black,
                      onDetailsPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, ProfileRoute);
                      },
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Color(0xFFC4C4C4),
                        child: Text(
                          globals.getInitials(currentUser.username),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFE0E0E0),
                              fontSize: 22),
                        ),
                      ),
                      margin: EdgeInsets.all(0),
                      accountName: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
                        child: Text(
                          "Hello, ${currentUser.username.split(' ')[0]}",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF000000),
                              fontSize: 22),
                        ),
                      ),
                      accountEmail: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          currentUser.email,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF000000),
                              fontSize: 12),
                        ),
                      ),
                      decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                ),
                Container(
                  color: Color(0xFFE0E0E0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                        child: ListTile(
                          title: Text(
                            'Home',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(context,
                                HomeRoute, (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Categories',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, CategoriesRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Wishlist',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, TnCRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Contact us',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'About us',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Help',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Share with friends',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Rate us',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 16),
                          ),
                          onTap: () {
                            popUpAlertDialog(
                                context: context,
                                text: "Are you sure want to log out?",
                                twoButtons: true,
                                func1: () {
                                  Navigator.pop(context);
                                  removeValue('jwt');
                                  removeValue('id');
                                  removeValue('confirmed');
                                  removeValue('blocked');
                                  removeValue('username');
                                  removeValue('email');
                                  removeValue('organisation');
                                  removeValue('orgemail');
                                  removeValue('phone');
                                  removeValue('createdAt');
                                  Navigator.pushReplacementNamed(
                                      context, LoginRoute);
                                },
                                button1text: "Yes",
                                func2: () {
                                  Navigator.pop(context);
                                },
                                button2text: "No");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                LineAwesomeIcons.facebook,
                                size: 36,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                LineAwesomeIcons.instagram,
                                size: 36,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                LineAwesomeIcons.linkedin_square,
                                size: 36,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                LineAwesomeIcons.twitter_square,
                                size: 36,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'All rights reserved XYZ Pvt Ltd.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF000000),
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
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
