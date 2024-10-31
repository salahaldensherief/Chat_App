import 'package:flutter/material.dart';

class CustemBotton extends StatelessWidget {
  CustemBotton({required this.bottontxt,this.onTap});
  VoidCallback? onTap;
String bottontxt;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (
      onTap
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
        ),
        child:
        Center(
          child: Text(
           bottontxt
          ),
        ),
      ),
    );
  }
}
