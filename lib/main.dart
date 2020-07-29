import 'package:eco_commerce_app/core/provider/user.dart';
import 'package:eco_commerce_app/core/services/analytics_service.dart';
import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/pages/undefinedScreen.dart';
import 'package:eco_commerce_app/ui/theme/theme.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/router.dart' as router;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routing_constants.dart';

SharedPreferences prefs;
final FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentUser>(
          create: (context) => CurrentUser(),
        ),
      ],
      child: MyApp(
        email: email,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String email;
  MyApp({this.email});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedScreen(
                name: settings.name,
              )),
      theme: kDefaultTheme,
      initialRoute: email == null ? OnboardRoute1 : HomeRoute,
    );
  }
}
