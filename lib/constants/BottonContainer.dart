import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottonContainer(double width,double height,ontap,String text, ){
  return   GestureDetector(
    onTap: ontap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x6348ef).withOpacity(1),
              Color(0x748ce9).withOpacity(1), // Hexadecimal color with full opacity
            ],
            // stops: [0.1, 1],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(26),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: "intermedi",
              decoration: TextDecoration.none),
          ),
        ),
      ),
  );
}
LinearGradient myGradient() {
  return LinearGradient(
    colors: [
      Color(0xFF7796E8),
      Color(0xFF5B29F2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}