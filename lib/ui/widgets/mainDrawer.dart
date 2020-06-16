import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/popUp.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:eco_commerce_app/main.dart' as main;
import 'package:eco_commerce_app/ui/theme/config.dart' as config;

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
                Consumer<CurrentUser>(
                  builder: (_, currentUser, __) => SafeArea(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, ProfileRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: config.Colors().mildSea,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                main.prefs.getString('googleimage') == null ||
                                        main.prefs.getString('googleimage') ==
                                            ""
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 0, 10),
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Color(0xFFE0E0E0),
                                          child: Text(
                                            globals.getInitials(
                                                currentUser.username),
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.teal[300],
                                                fontSize: 22),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 0, 10),
                                        child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(main
                                                .prefs
                                                .getString("googleimage"))),
                                      ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    "Hello, ${currentUser.username.split(' ')[0]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
                                          color: config.Colors().mainColor(1),
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Home',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
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
                          dense: true,
                          title: Text(
                            'Shop by Category',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
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
                          dense: true,
                          title: Text(
                            'Trending Products',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, TrendingRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Your Orders',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, OrderRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Your Wishlist',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, WishListRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Your Account',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, ProfileRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'About us',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AboutRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Contact us',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, ContactUsRoute);
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Help',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, HelpRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Terms and Conditions',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
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
                          dense: true,
                          title: Text(
                            'Frequently Asked Questions',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, FAQRoute);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        child: Container(
                          color: Color(0xFF929292).withOpacity(0.53),
                          height: 1,
                        ),
                      ),
                      Consumer<CurrentUser>(
                        builder: (_, currentUser, __) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListTile(
                            dense: true,
                            title: Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontSize: 16),
                            ),
                            onTap: () {
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
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       IconButton(
                      //         icon: Icon(
                      //           LineAwesomeIcons.facebook,
                      //           size: 36,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //       IconButton(
                      //         icon: Icon(
                      //           LineAwesomeIcons.instagram,
                      //           size: 36,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //       IconButton(
                      //         icon: Icon(
                      //           LineAwesomeIcons.linkedin_square,
                      //           size: 36,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //       IconButton(
                      //         icon: Icon(
                      //           LineAwesomeIcons.twitter_square,
                      //           size: 36,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8),
                      //   child: ListTile(
                      //     dense: true,
                      //     title: Text(
                      //       'All rights reserved XYZ Pvt Ltd.',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //           fontFamily: 'Poppins',
                      //           color: Color(0xFF000000),
                      //           fontSize: 10),
                      //     ),
                      //   ),
                      // ),
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
