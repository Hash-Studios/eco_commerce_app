import 'package:eco_commerce_app/core/auth/google_auth.dart';
import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/ui/widgets/googleButton.dart' as googleButton;

final GoogleAuth gAuth = googleButton.gAuth;

class CurrentUser extends ChangeNotifier {
  String jwt;
  String id;
  String confirmed;
  String blocked;
  String username;
  String email;
  String organisation;
  String orgemail;
  String phone;
  String createdAt;
  CurrentUser({
    this.jwt,
    this.id,
    this.confirmed,
    this.blocked,
    this.username,
    this.email,
    this.organisation,
    this.orgemail,
    this.phone,
    this.createdAt,
  });

  bool saveUsertoSP() {
    try {
      addStringToSP('jwt', this.jwt);
      addStringToSP('id', this.id);
      addStringToSP('confirmed', this.confirmed);
      addStringToSP('blocked', this.blocked);
      addStringToSP('username', this.username);
      addStringToSP('email', this.email);
      addStringToSP('organisation', this.organisation);
      addStringToSP('orgemail', this.orgemail);
      addStringToSP('phone', this.phone);
      addStringToSP('createdAt', this.createdAt);
      return true;
    } catch (e) {
      return false;
    }
  }

  void getUserfromResp(var res) {
    this.jwt = res["jwt"];
    this.confirmed = res["user"]["confirmed"].toString();
    this.blocked = res["user"]["blocked"].toString();
    this.id = res["user"]["id"];
    this.username = res["user"]["username"];
    this.email = res["user"]["email"];
    this.organisation = res["user"]["organisation"];
    this.orgemail = res["user"]["orgemail"];
    this.phone = res["user"]["phone"];
    this.createdAt = res["user"]["createdAt"];
    notifyListeners();
  }

  Future<void> getUserfromSP() async {
    try {
      this.jwt = await getStringFromSP('jwt');
      this.id = await getStringFromSP('id');
      this.confirmed = await getStringFromSP('confirmed');
      this.blocked = await getStringFromSP('blocked');
      this.username = await getStringFromSP('username');
      this.email = await getStringFromSP('email');
      this.organisation = await getStringFromSP('organisation');
      this.orgemail = await getStringFromSP('orgemail');
      this.phone = await getStringFromSP('phone');
      this.createdAt = await getStringFromSP('createdAt');
    } catch (e) {
      this.jwt = await getStringFromSP('jwt');
      this.id = await getStringFromSP('id');
      this.confirmed = await getStringFromSP('confirmed');
      this.blocked = await getStringFromSP('blocked');
      this.username = await getStringFromSP('username');
      this.email = await getStringFromSP('email');
      this.organisation = await getStringFromSP('organisation');
      this.orgemail = await getStringFromSP('orgemail');
      this.phone = await getStringFromSP('phone');
      this.createdAt = await getStringFromSP('createdAt');
    }
    notifyListeners();
  }

  bool deleteUser() {
    try {
      gAuth.signOutGoogle();
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
      this.jwt = "";
      this.id = "";
      this.confirmed = "";
      this.blocked = "";
      this.username = "";
      this.email = "";
      this.organisation = "";
      this.orgemail = "";
      this.phone = "";
      this.createdAt = "";
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }
}
