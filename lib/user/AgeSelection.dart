import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'WeightSelection.dart';

class Ageselection extends StatefulWidget {
  const Ageselection({super.key});

  @override
  State<Ageselection> createState() => _AgeselectionState();
}

class _AgeselectionState extends State<Ageselection> {
  int selectedAge =25;
  bool change = false;
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
              SizedBox(height: height/12.34,),
              Text("How old are you ?",
                style: TextStyle(
                    fontFamily: "interbold",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              SizedBox(height: height/270.3),
              Text("This help us create your plan   ",
                style: TextStyle(
                    fontFamily: "interlight",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              SizedBox(height: height/14.74,),
              Container(
                height: height/1.900, // Height of the picker
                child: CupertinoPicker(
                  selectionOverlay: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width/3.16),
                        height: 10,
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
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width/3.16),
                        height: 10,
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
                  itemExtent: height/10.30, // Height of each item
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedAge = index + 10; // Age from 10 to 100
                      change=true;
                    });
                  },
                  children: List<Widget>.generate(91, (index) {
                    return Center(
                      child: Text(
                        "${index + 10}", // Display ages from 10 upwards
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: height/5.70,),
              Padding(
                padding:  EdgeInsets.only(left: width/1.95),
                child: bottonContainer(
                    width / 3.30,
                    height / 18.93,
                        (){
                          if (!change) { // !change means change == false
                           showCustomSnackBar(context, 'Please select your age.');
                          } else {
                            callNext(context, Weightselection());
                          }
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
