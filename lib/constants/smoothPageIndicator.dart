import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
Widget smoothIndicator(PageController controller) {
  return SmoothPageIndicator(
    controller: controller,
    count: 3,
    effect: ExpandingDotsEffect(
      activeDotColor: Colors.blue,
      dotColor: Colors.grey,
      dotHeight: 7,
      dotWidth: 13,
      spacing: 10,
      expansionFactor: 3,
    ),
  );
}