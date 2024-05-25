import 'dart:convert';

import 'package:fanclub/common/app_message.dart';
import 'package:fanclub/model/user_model.dart';
import 'package:fanclub/screen/dashboard/dashboard_screen.dart';
import 'package:fanclub/service/pref_service.dart';
import 'package:fanclub/utils/endpoints.dart';
import 'package:fanclub/utils/pref_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool loader = false.obs;

  TextEditingController emailController = TextEditingController(text: "shyam.forex12@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "Qw@123456");

  var userDate = UserModel().obs;

  Future<void> handleTap({required String email,required String password}) async{
    loader.value = true;
    await loginApi(email: email, password: password).then((value) async {
      if(value != null)
        {
          userDate.value = value;
          await PrefService.setLogin();

          // await prefs.setString(_key, _value);
          //
          await PrefService.setToken(userDate.value.data?.token ?? "");
          await PrefService.setUid(userDate.value.data?.id ?? 0);
          Get.offAll(()=>DashboardScreen());
        }
    },);
    loader.value = false;
  }

  Future<UserModel?> loginApi(
      {required String email, required String password}) async {
    try {
      loader.value = true;
      Map<String, dynamic> body = {"email": email, "password": password};
      final response = await http.post(
        Uri.parse(Endpoints.loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String,dynamic> res = jsonDecode(response.body);
        if(res["status"])
          {
            loader.value = false;
            showToast("Login successfully");
            return userModelFromJson(response.body);

          }
        else{
          String msg = res["message"] ?? "";
          errorToast(msg);
        }

      } else {
        errorToast("Something went wrong");
      }
      loader.value = false;
    } catch (e) {
      loader.value = false;
      return null;
    }
    return null;
  }
}
