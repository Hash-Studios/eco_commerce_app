import 'package:shared_preferences/shared_preferences.dart';

addStringToSP(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

addIntToSP(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

addDoubleToSP(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

addBoolToSP(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

getStringFromSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(key);
  return stringValue;
}

getBoolFromSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool(key);
  return boolValue;
}

getIntFromSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int intValue = prefs.getInt(key);
  return intValue;
}

getDoubleFromSP(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double doubleValue = prefs.getDouble(key);
  return doubleValue;
}

removeValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

checkValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}
