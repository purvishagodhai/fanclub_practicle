import 'package:fanclub/screen/dashboard/dashboard_screen.dart';
import 'package:fanclub/screen/login/login_screen.dart';
import 'package:fanclub/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  Future<void> handleNavigation() async{
    await Future.delayed(const Duration(seconds: 1));
    bool isLogin = await PrefService.getLogin();
    if(isLogin)
      {
        Get.offAll(()=>  DashboardScreen());
      }
    else{
        Get.offAll(()=> LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
