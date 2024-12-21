import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';

import '../constants/bodyContainer.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  int _countdown = 5;  // Starting timer value
  late Timer _timer;  // Timer variable to manage countdown
  double _borderWidth = 10;  // Starting border width
  double _fontSize = 20;  // Starting font size for the countdown text

  @override
  void initState() {
    super.initState();
    // Start the timer as soon as the widget is created
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        // When the countdown reaches 0, navigate to the BottomNavigationPage
        callNextReplacement(context, BottomNavigationPage());
        _timer.cancel();  // Cancel the timer once the navigation happens
      } else {
        setState(() {
          _countdown--;  // Decrease the countdown by 1 each second
          _borderWidth = 10 * (_countdown / 5);  // Reduce border width as time reduces
          _fontSize = 34 * (_countdown / 5);  // Reduce the font size based on the countdown
        });
      }
    });
  }

  @override
  void dispose() {
    // Ensure to cancel the timer if the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PremiumContainer(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.only(top: height / 17.56, left: width / 1.30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,  // Keep the background transparent
                      shape: BoxShape.circle,  // Keep the shape as circle
                      border: Border.all(
                        color: Colors.white,  // Border color
                        width: 3,  // Dynamic border width
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$_countdown',  // Display the countdown number
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _fontSize,  // Dynamically change the font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    width: 40,  // Set the width of the circle container
                    height: 40,  // Set the height of the circle container
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
