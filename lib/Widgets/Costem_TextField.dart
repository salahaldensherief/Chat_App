import 'package:flutter/material.dart';

class CustemTextFormField extends StatelessWidget {
  CustemTextFormField({this.hintText,this.onChanged,this.obscureText=false});
String? hintText;
Function(String)? onChanged;
bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data)
      {
        if(data!.isEmpty)
          return 'value is wrong';
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),

    );
  }
}
