import 'dart:convert';

import 'package:fanclub/common/app_message.dart';
import 'package:fanclub/model/favourite_model.dart';
import 'package:fanclub/service/pref_service.dart';
import 'package:fanclub/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController{
  RxBool loader = false.obs;

   ScrollController screollController = ScrollController();
  FavouriteModel favouriteData = FavouriteModel();
  RxList<MyPlayer> favouritePlayers = <MyPlayer>[].obs;
   int page= 1;
   RxBool hasMoreData = true.obs;
      RxInt uId = 0.obs;
      RxString token = "".obs;


  @override
  void onInit() {
    getUid();
    screollController = ScrollController()..addListener(() async {
      if( screollController.offset >= screollController.position.maxScrollExtent)
        {
          if(hasMoreData.value)
          {
            await fetchFavourites(page: page).then((value) {
              if(value != null)
              {
                favouriteData = value;
                favouritePlayers.value.addAll(favouriteData.myFavoritePlayer ??[]);
                favouritePlayers.refresh();
              }
            },);
          }
        }

    },);
    super.onInit();
  }




  @override
  void dispose() {
    screollController.dispose();
    super.dispose();
  }


  Future<void> getUid() async{
    uId.value = await PrefService.getUid();
    token.value = await PrefService.getToken();
    await fetchFavourites(page: page).then((value) {
      if(value != null)
      {
        favouriteData = value;
        favouritePlayers.value.addAll(favouriteData.myFavoritePlayer ??[]);
        favouritePlayers.refresh();
      }
    },);
  }


  Future<FavouriteModel?> fetchFavourites({required int page}) async {
    try {
      loader.value = true;
      Map<String, dynamic> body = {
        "user_id": uId.value,
        "page": page
      };
      final response = await http.post(
        Uri.parse(Endpoints.favouriteUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Token':"bearer ${token.value}"
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String,dynamic> res = jsonDecode(response.body);
        if(res["status"])
        {
          loader.value = false;
          page++;
          return favouriteModelFromJson(response.body);
        }
        else{
          String msg = res["message"] ?? "";
          errorToast(msg);
          hasMoreData.value = false;
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