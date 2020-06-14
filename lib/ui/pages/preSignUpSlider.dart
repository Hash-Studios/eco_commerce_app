import 'package:eco_commerce_app/ui/widgets/appDescText.dart';
import 'package:eco_commerce_app/ui/widgets/appNameText.dart';
import 'package:eco_commerce_app/ui/widgets/continueButton.dart';
import 'package:eco_commerce_app/ui/widgets/imageSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreSignUpSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
