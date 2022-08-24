//CACHE
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

 class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolen({
    required String isDark,
    required bool value,
  })async {
    return await sharedPreferences!.setBool(isDark, value);
    
  }

  static bool? getBoolen({
    required String isDark,
  }) {
    return  sharedPreferences?.getBool(isDark);
    
  }
}
