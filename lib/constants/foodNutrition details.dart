import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildNutritionCard(String title, String value,double firstwidth,double secondwidth,) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: firstwidth,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: secondwidth,
          ),
        ),
      ],
    ),
  );
}
