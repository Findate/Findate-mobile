import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
static SharedPreferences? _preferences;


  static const keyInitialized = 'init'; //initialize a null bool for shared pref


//init shared pref package
  static Future init() async => _preferences = await SharedPreferences.getInstance();

//set bool key from funtion to true or false
  static Future setInitialized(bool initialized) async => await _preferences!.setBool(keyInitialized, initialized);

// get key function
  static bool? getInitialized() => _preferences!.getBool(keyInitialized);
 


}