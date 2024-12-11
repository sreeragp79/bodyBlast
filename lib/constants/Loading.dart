import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget loader(){
  return SizedBox(
    width: 100,
    height: 100,
    child: Lottie.asset(
      "assets/animation/LoadingAnimation.json",
    ),
  );
}