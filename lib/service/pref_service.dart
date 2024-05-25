import 'package:fanclub/utils/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService{
  static Future<void> init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
}

  static  Future<void> setLogin() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(PrefKeys.isLogin, true);
}

  static  Future<bool> getLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool(PrefKeys.isLogin) ?? false;
    return isLogin;
  }

  static Future<void> setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefKeys.token, token);
  }

  static  Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefKeys.token) ?? "";
    return token;
  }

  static Future<void> setUid(int id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(PrefKeys.userId, id);
  }

  static  Future<int> getUid() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uId = prefs.getInt(PrefKeys.userId) ?? 0;
    return uId;
  }

  static  Future<void> clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  }
}