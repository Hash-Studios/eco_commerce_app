import 'package:eco_commerce_app/routing_constants.dart';
import 'package:eco_commerce_app/ui/widgets/appDescText.dart';
import 'package:eco_commerce_app/ui/widgets/appNameText.dart';
import 'package:eco_commerce_app/ui/widgets/continueButton.dart';
import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreSignUpSlider extends StatelessWidget {
  var email = "";
  getLoggedIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (email != "") {
      Navigator.pushReplacementNamed(context, HomeRoute);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSlider(
                height: height,
              ),
              AppNameText(),
              AppDescText(),
              ContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}
