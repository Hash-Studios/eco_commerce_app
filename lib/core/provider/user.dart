import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:flutter/material.dart';

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
      addStringToSP('jwt', "your jWT");
      addStringToSP('id', "your id");
      addStringToSP('confirmed', "true");
      addStringToSP('blocked', "false");
      addStringToSP('username', "Joe Rudd");
      addStringToSP('email', "joelrudd13@gmail.com");
      addStringToSP('organisation', "Sao Pao Chips Company");
      addStringToSP('orgemail', "joerudd@saopaochips.com");
      addStringToSP('phone', "1234567890");
      addStringToSP('createdAt', "20 June 2020");
      return true;
    } catch (e) {
      return false;
    }
  }

  void getUserfromResp() {
    this.jwt = "your jWT";
    this.id = "your id";
    this.confirmed = "true";
    this.blocked = "false";
    this.username = "Joe Rudd";
    this.email = "joelrudd13@gmail.com";
    this.organisation = "Sao Pao Chips Company";
    this.orgemail = "joerudd@saopaochips.com";
    this.phone = "1234567890";
    this.createdAt = "20 June 2020";
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
