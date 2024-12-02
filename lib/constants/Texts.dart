
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildStatColumn(String number, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        number,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontFamily: "jeju",
          color: Colors.grey.withOpacity(0.70),
          fontSize: 13,
        ),
      ),
    ],
  );
}