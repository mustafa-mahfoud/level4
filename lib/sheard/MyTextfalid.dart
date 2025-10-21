import 'package:flutter/material.dart';



class MyTextfalid extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final TextEditingController controller;
  const MyTextfalid({
    super.key,
    required this.onChanged,
    required this.suffixIcon,
    required this.validator,
    required this.autovalidateMode,
    required this.keyboardType,
    required this.obscureText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        autovalidateMode: autovalidateMode,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          // To delete borders
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //color: mygreen,
            ),
          ),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
