import 'package:body_blast/constants/BottonContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'LoginPage.dart';
import 'WeightSelection.dart';

class Goalselection extends StatefulWidget {
  const Goalselection({super.key});

  @override
  State<Goalselection> createState() => _AgeselectionState();
}

class _AgeselectionState extends State<Goalselection> {

  String selectedGoal= "Gain weight";
  List<String>Goals=[
    "Gain weight",
    "Lose weight",
    "Get fitter",
    "Gain more flexible",
    "Learn the basic",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:bodyContainer(
          height,
          width,
          Column(
              children: [
                SizedBox(height: height/12.34,),
                Text("What’s  your goal ?",
                  style: TextStyle(
                      fontFamily: "interbold",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: height/270.3),
                Text("This help us create your plan   ",
                  style: TextStyle(
                      fontFamily: "interlight",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: height/14.74,),
                Container(
                  height: height/1.800, // Height of the picker
                  child: CupertinoPicker(
                    selectionOverlay: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width/4.16),
                          height: 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0x7796E8).withOpacity(1),
                                    Color(0x6141f0).withOpacity(1),
                                  ]
                              )
                          ),
                        ),
                        SizedBox(height: height/9.01,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width/4.16),
                          height: 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0x7796E8).withOpacity(1),
                                    Color(0x6141f0).withOpacity(1),
                                  ]
                              )
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    magnification: 1.3,
                    useMagnifier: true,
                    diameterRatio:40,
                    itemExtent: height/10.13, // Height of each item
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedGoal = Goals[index];
                      });
                    },
                    children: List<Widget>.generate(Goals.length, (index) {
                      return Center(
                        child: Text(
                          Goals[index], // Display the names
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: height/7.10,),
                Padding(
                  padding:  EdgeInsets.only(left: width/1.95),
                  child: bottonContainer(
                      width / 3.30,
                      height / 18.93,
                          (){
                        callNext(context, Loginpage());
                      },
                      "Next >"
                  ),
                )
              ]
          ),
        )
    );
  }
}
