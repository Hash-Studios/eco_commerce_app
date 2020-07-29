import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/pages/FAQScreen.dart';
import 'package:eco_commerce_app/ui/pages/aboutUsScreen.dart';
import 'package:eco_commerce_app/ui/pages/categoriesScreen.dart';
import 'package:eco_commerce_app/ui/pages/categoryScreen.dart';
import 'package:eco_commerce_app/ui/pages/codeVerificationScreen.dart';
import 'package:eco_commerce_app/ui/pages/contactUsScreen.dart';
import 'package:eco_commerce_app/ui/pages/helpScreen.dart';
import 'package:eco_commerce_app/ui/pages/onboardScreen1.dart';
import 'package:eco_commerce_app/ui/pages/onboardScreen2.dart';
import 'package:eco_commerce_app/ui/pages/onboardScreen3.dart';
import 'package:eco_commerce_app/ui/pages/orderPopUpScreen.dart';
import 'package:eco_commerce_app/ui/pages/orderScreen.dart';
import 'package:eco_commerce_app/ui/pages/productScreen.dart';
import 'package:eco_commerce_app/ui/pages/resetPasswordScreen.dart';
import 'package:eco_commerce_app/ui/pages/search.dart';
import 'package:eco_commerce_app/ui/pages/signupLandingScreen.dart';
import 'package:eco_commerce_app/ui/pages/terms.dart';
import 'package:eco_commerce_app/ui/pages/homeNew.dart';
import 'package:eco_commerce_app/ui/pages/loginScreen.dart';
// import 'package:eco_commerce_app/ui/pages/preSignUpSlider.dart';
import 'package:eco_commerce_app/ui/pages/profileScreen.dart';
import 'package:eco_commerce_app/ui/pages/registerScreen.dart';
import 'package:eco_commerce_app/ui/pages/trendingScreen.dart';
import 'package:eco_commerce_app/ui/pages/undefinedScreen.dart';
import 'package:eco_commerce_app/ui/pages/userOptionalScreen.dart';
import 'package:eco_commerce_app/ui/pages/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case PreSignUpRoute:
    //   return CupertinoPageRoute(builder: (context) => PreSignUpSlider());
    // case MainRoute:
    //   main();
    //   break;
    case LoginRoute:
      return CupertinoPageRoute(builder: (context) => LoginScreen());
    case RegisterRoute:
      return CupertinoPageRoute(builder: (context) => RegisterScreen());
    case SearchRoute:
      return CupertinoPageRoute(builder: (context) => SearchScreen());
    case TnCRoute:
      return CupertinoPageRoute(builder: (context) => TermsConditions());
    case HomeRoute:
      return CupertinoPageRoute(builder: (context) => HomeNew());
    case ContactUsRoute:
      return CupertinoPageRoute(builder: (context) => ContactUsScreen());
    case HelpRoute:
      return CupertinoPageRoute(builder: (context) => HelpScreen());
    case FAQRoute:
      return CupertinoPageRoute(builder: (context) => FAQScreen());
    case CategoriesRoute:
      return CupertinoPageRoute(builder: (context) => CategoriesScreen());
    case ProfileRoute:
      return CupertinoPageRoute(builder: (context) => ProfileScreen());
    case WishListRoute:
      return CupertinoPageRoute(builder: (context) => WishListScreen());
    case OnboardRoute1:
      return CupertinoPageRoute(builder: (context) => OnboardScreen1());
    case OnboardRoute2:
      return CupertinoPageRoute(builder: (context) => OnboardScreen2());
    case OnboardRoute3:
      return CupertinoPageRoute(builder: (context) => OnboardScreen3());
    case SignUpLandingRoute:
      return CupertinoPageRoute(builder: (context) => SignUpLandingScreen());
    case TrendingRoute:
      return CupertinoPageRoute(builder: (context) => TrendingScreen());
    case OrderRoute:
      return CupertinoPageRoute(builder: (context) => OrdersScreen());
    case AboutRoute:
      return CupertinoPageRoute(builder: (context) => AboutUsScreen());
    case OrderConfirmRoute:
      return CupertinoPageRoute(
        builder: (context) => OrderPopUp(
          arguements: settings.arguments,
        ),
      );
    case CodeVerificationRoute:
      return CupertinoPageRoute(
        builder: (context) => CodeVerificationScreen(
          arguements: settings.arguments,
        ),
      );
    case ResetPasswordRoute:
      return CupertinoPageRoute(
        builder: (context) => ResetPasswordScreen(
          arguements: settings.arguments,
        ),
      );
    case CategoryRoute:
      return CupertinoPageRoute(
        builder: (context) => CategoryScreen(
          arguements: settings.arguments,
        ),
      );
    case UserOptionalRoute:
      return CupertinoPageRoute(
        builder: (context) => UserOptionalScreen(
          arguements: settings.arguments,
        ),
      );
    case ProductRoute:
      return CupertinoPageRoute(
        builder: (context) => ProductScreen(
          arguements: settings.arguments,
        ),
      );
    default:
      return CupertinoPageRoute(
        builder: (context) => UndefinedScreen(
          name: settings.name,
        ),
      );
  }
}
