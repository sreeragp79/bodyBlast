import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget updateTextField({
  required String hintText,
  required double width,
  TextEditingController? controller,
}) {
  return Container(
    width: width / 5.30,
    height: 60,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white.withOpacity(0.60), width: width / 999.99),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      style:  TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "InterLight",
      ),
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle:  TextStyle(
          color: Colors.white,
          fontFamily: "interlight",
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget mainTextField({
  required String hintText,
  required double width,
  required double height,
  TextEditingController? controller,
}) {
  return Container(
    width: width / 1.37,
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white.withOpacity(0.60), width: width / 999.99),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: null,
      style:  TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "InterLight",
      ),
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle:  TextStyle(
          color: Colors.white,
          fontFamily: "interlight",
          fontSize: 15,
        ),
      ),
    ),
  );
}

// Address Fileds

Widget addressTextField({
required String labelText,
required double width,
required double height,
TextEditingController? controller,
}){
  return   Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
    ),
    child: TextField(
      controller: controller,
      style:  TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "InterLight",
      ),
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        border: InputBorder.none,
        labelText: labelText,
        labelStyle:  TextStyle(
          color: Colors.grey,
          fontFamily: "interlight",
          fontSize: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.60), width: width / 999.99),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.60), width: width / 999.99),
        ),
      ),
    ),
  );
}


