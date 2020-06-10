import 'package:eco_commerce_app/core/data/sharedPrefHandler.dart';
import 'package:flutter/material.dart';

class CurrentUser {
  final String jwt;
  final String id;
  final String confirmed;
  final String blocked;
  final String username;
  final String email;
  final String createdAt;
  CurrentUser({
    @required this.jwt,
    @required this.id,
    @required this.confirmed,
    @required this.blocked,
    @required this.username,
    @required this.email,
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
        createdAt: await getStringFromSP('createdAt'),
      );
    }
  }
}
