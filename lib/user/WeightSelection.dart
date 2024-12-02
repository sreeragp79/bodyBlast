import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/colors.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:body_blast/user/AgeSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'GoalSelection.dart';

class Weightselection extends StatefulWidget {
  const Weightselection({super.key});

  @override
  State<Weightselection> createState() => WeightselectionState();
}

class WeightselectionState extends State<Weightselection> {
  int selectedWeight = 30;
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose(); // Dispose of the scroll controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: bodyContainer(
        height,
        width,
        Column(
          children: [
            SizedBox(height: height / 12.34),
            Text(
              "What's your weight?",
              style: TextStyle(
                fontFamily: "interbold",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: height / 270.3),
            Text(
              "This helps us create your plan",
              style: TextStyle(
                fontFamily: "interlight",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: height / 4.74),
            // Custom Tick Mark Slider
            Container(
              height: height/8.9,
            width: width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification) {
                    setState(() {
                      selectedWeight = 30 + (scrollController.offset ~/ 10);
                      if (selectedWeight < 30) selectedWeight = 30;
                      if (selectedWeight > 200) selectedWeight = 200;
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(171 * 2, (index) {
                      bool isMajorTick = index % 2 == 0;
                      return Transform.translate(
                        offset: isMajorTick ? Offset(5, 2) : Offset(3, 9),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          width: 7,
                          height: isMajorTick ? 80 : 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                           gradient: LinearGradient(
                           colors: [startGradientColor,endGradientColor],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                           )
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            // Display selected weight
            Text(
              "$selectedWeight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height / 2.65),
            Padding(
              padding: EdgeInsets.only(left: width / 1.95),
              child: bottonContainer(
                width / 3.30,
                height / 18.93,
                    () {
                      if (selectedWeight==30) { // !change means change == false
                       showCustomSnackBar(context,  'Please select your age.');
                      } else {
                        callNext(context, Goalselection());
                      }
                },
                "Next >",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
