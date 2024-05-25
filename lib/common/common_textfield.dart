import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
final TextEditingController controller;
final String hint;
 final String? Function(String?)? validator;
   const CommonTextField({super.key, required this.controller, required this.hint, this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey)
      ),
    );
  }
}