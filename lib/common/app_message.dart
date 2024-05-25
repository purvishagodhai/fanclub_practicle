import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showToast(String message){
  Get.snackbar("Success", message,backgroundColor: Colors.green,colorText: Colors.white);
}

void errorToast(String message){
  Get.snackbar("Error", message,backgroundColor: Colors.red,colorText: Colors.white);
}