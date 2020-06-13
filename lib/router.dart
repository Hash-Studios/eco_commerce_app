import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/pages/categoriesScreen.dart';
import 'package:eco_commerce_app/ui/pages/terms.dart';
import 'package:eco_commerce_app/ui/pages/homeScreen.dart';
import 'package:eco_commerce_app/ui/pages/loginScreen.dart';
import 'package:eco_commerce_app/ui/pages/preSignUpSlider.dart';
import 'package:eco_commerce_app/ui/pages/profileScreen.dart';
import 'package:eco_commerce_app/ui/pages/registerScreen.dart';
import 'package:eco_commerce_app/ui/pages/search.dart';
import 'package:eco_commerce_app/ui/pages/undefinedScreen.dart';
import 'package:eco_commerce_app/ui/pages/userOptionalScreen.dart';
import 'package:eco_commerce_app/ui/pages/categoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/pages/homeScreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PreSignUpRoute:
      return CupertinoPageRoute(builder: (context) => PreSignUpSlider());
    case LoginRoute:
      return CupertinoPageRoute(builder: (context) => LoginScreen());
    case RegisterRoute:
      return CupertinoPageRoute(builder: (context) => RegisterScreen());
    case SearchRoute:
      return CupertinoPageRoute(builder: (context) => SearchScreen());
    case TnCRoute:
      return CupertinoPageRoute(builder: (context) => TermsConditions());
    case HomeRoute:
      return CupertinoPageRoute(builder: (context) => HomeScreen());
    case CategoryRoute:
      return CupertinoPageRoute(
          builder: (context) => CategoryScreen(
                arguements: settings.arguments,
              ));
    case CategoriesRoute:
      return CupertinoPageRoute(builder: (context) => CategoriesScreen());
    case ProfileRoute:
      return CupertinoPageRoute(builder: (context) => ProfileScreen());
    case UserOptionalRoute:
      return CupertinoPageRoute(
          builder: (context) => UserOptionalScreen(
                arguements: settings.arguments,
              ));
    default:
      return CupertinoPageRoute(
          builder: (context) => UndefinedScreen(
                name: settings.name,
              ));
  }
}
