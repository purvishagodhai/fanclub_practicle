import 'package:fanclub/common/common_textfield.dart';
import 'package:fanclub/screen/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  LoginController controller = Get.put(LoginController());

   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Login"),centerTitle: true),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.035),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15),
              CommonTextField(controller: controller.emailController, hint: 'Enter email',validator: (val) {
                if(val!.trim().isEmpty)
                  {
                    return "Please enter email";
                  }
                else if(!GetUtils.isEmail(val.trim()))
                {
                  return "Please enter valid email";
                }
                  return null;
              },),
              SizedBox(height: height*0.02),
              CommonTextField(controller: controller.passwordController, hint: 'Enter password',validator: (val) {
                if(val!.trim().isEmpty)
                {
                  return "Please enter password";
                }
                return null;
              },),
              SizedBox(height: height*0.04),
              Obx(
                  ()=>controller.loader.value ? CircularProgressIndicator():
                  ElevatedButton(onPressed: () async{
                  if (_formKey.currentState!.validate()) {

                   await controller.handleTap(email: controller.emailController.text.trim(), password: controller.passwordController.text.trim());
                  }
                }, child: Text("Login"),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


