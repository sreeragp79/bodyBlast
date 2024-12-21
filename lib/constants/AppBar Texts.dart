import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appbarText(String text,double width) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "intermedi",
      fontSize: width,
      color: CupertinoColors.white,
      decoration: TextDecoration.none,
    ),
  );
}

Widget headingText(String text,) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "interbold",
      fontSize: 34,
      color: CupertinoColors.white,
    ),
  );
}
Widget profileTexts(String text,ontap){
  return GestureDetector(
    onTap: ontap,
    child:  Text(text,
      style: TextStyle(
        fontFamily: "interlight",
        color: CupertinoColors.white,
        fontSize: 16,
      ),
    ),
  );
}
Widget experience (String text,){
  return Text(text,
    style: TextStyle(
      fontFamily: "intermedi",
      color: Colors.grey.withOpacity(0.56),
      fontSize: 13,
    ),
  );
}
Widget TrainersName (String text,double width){
  return Text(text,
    style: TextStyle(
      height: 1.10,
      fontFamily: "jeju",
      fontSize: width,
      color: CupertinoColors.white,
    ),
  );
}
Widget Sets (String text,){
  return Text(text,
   style: TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontFamily: "interlight",
    ),
  );
}
