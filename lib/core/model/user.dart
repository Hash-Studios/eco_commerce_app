import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:flutter/material.dart';

class CurrentUser {
  final String jwt;
  final String id;
  final String confirmed;
  final String blocked;
  final String username;
  final String email;
  final String organisation;
  final String orgemail;
  final String phone;
  final String createdAt;
  CurrentUser({
    @required this.jwt,
    @required this.id,
    @required this.confirmed,
    @required this.blocked,
    @required this.username,
    @required this.email,
    @required this.organisation,
    @required this.orgemail,
    @required this.phone,
    @required this.createdAt,
  });

  bool saveUsertoSP() {
    try {
      addStringToSP('jwt', jwt);
      addStringToSP('id', id);
      addStringToSP('confirmed', confirmed);
      addStringToSP('blocked', blocked);
      addStringToSP('username', username);
      addStringToSP('email', email);
      addStringToSP('organisation', organisation);
      addStringToSP('orgemail', orgemail);
      addStringToSP('phone', phone);
      addStringToSP('createdAt', createdAt);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<CurrentUser> getUserfromSP() async {
    try {
      return CurrentUser(
        jwt: await getStringFromSP('jwt'),
        id: await getStringFromSP('id'),
        confirmed: await getStringFromSP('confirmed'),
        blocked: await getStringFromSP('blocked'),
        username: await getStringFromSP('username'),
        email: await getStringFromSP('email'),
        organisation: await getStringFromSP('organisation'),
        orgemail: await getStringFromSP('orgemail'),
        phone: await getStringFromSP('phone'),
        createdAt: await getStringFromSP('createdAt'),
      );
    } catch (e) {
      return CurrentUser(
        jwt: await getStringFromSP('jwt'),
        id: await getStringFromSP('id'),
        confirmed: await getStringFromSP('confirmed'),
        blocked: await getStringFromSP('blocked'),
        username: await getStringFromSP('username'),
        email: await getStringFromSP('email'),
        organisation: await getStringFromSP('organisation'),
        orgemail: await getStringFromSP('orgemail'),
        phone: await getStringFromSP('phone'),
        createdAt: await getStringFromSP('createdAt'),
      );
    }
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
      return true;
    } catch (e) {
      return false;
    }
  }
}
