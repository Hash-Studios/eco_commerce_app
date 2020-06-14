import 'package:eco_commerce_app/main.dart' as main;
addStringToSP(String key, String value) async {
  main.prefs.setString(key, value);
}

addIntToSP(String key, int value) async {
  main.prefs.setInt(key, value);
}

addDoubleToSP(String key, double value) async {
  main.prefs.setDouble(key, value);
}

addBoolToSP(String key, bool value) async {
  main.prefs.setBool(key, value);
}

getStringFromSP(String key) async {
  String stringValue = main.prefs.getString(key);
  return stringValue;
}

getBoolFromSP(String key) async {
  bool boolValue = main.prefs.getBool(key);
  return boolValue;
}

getIntFromSP(String key) async {
  int intValue = main.prefs.getInt(key);
  return intValue;
}

getDoubleFromSP(String key) async {
  double doubleValue = main.prefs.getDouble(key);
  return doubleValue;
}

removeValue(String key) async {
  main.prefs.remove(key);
}

checkValue(String key) async {
  return main.prefs.containsKey(key);
}
