import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Navigator.dart';
import 'AgeSelection.dart';

class Genderselection extends StatefulWidget {
  const Genderselection({super.key});

  @override
  State<Genderselection> createState() => _GenderselectionState();
}

class _GenderselectionState extends State<Genderselection> {
  String? selectedGender;
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
             Container(
               width: 265,
               child: FittedBox(
                 fit: BoxFit.contain,
                 child: Text("Tell us about yourself!",
                   style: TextStyle(
                     fontFamily: "interbold",
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
              SizedBox(height: height/270.3),
              Container(
                width: 210,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("To give you a better experience we need \n"
                      "                 to know your gender",
                    style: TextStyle(
                        fontFamily: "interlight",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/6.34,),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = "Male";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 23),
                      height: height/6.10,
                      width: height /6.10,
                      decoration: BoxDecoration(
                        gradient: selectedGender == "Male"? myGradient():null,
                        color: selectedGender == "Male"? null:CupertinoColors.inactiveGray,
                        shape: BoxShape.circle,
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Image.asset("assets/image/Male.png"),
                          Text("Male",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "intermedi",
                            fontSize: width / 21.63,
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/25.8,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Female";
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 25,right: 25,top: 25),
                  height: height/6.10,
                  width: height /6.10,
                  decoration: BoxDecoration(
                    gradient: selectedGender == "Female"? myGradient():null,
                    color: selectedGender == "Female"? null:CupertinoColors.inactiveGray,
                    shape: BoxShape.circle,
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/image/Female.png"),
                      Text("Female",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "intermedi",
                          fontSize: width / 21.63,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/4.50),
              Padding(
                padding:  EdgeInsets.only(left: width/1.95),
                child: bottonContainer(
                    width / 3.30,
                  height / 18.93,
                      (){
                        if (selectedGender == null) {
                      showCustomSnackBar(context, 'Please select your gender.');
                        } else {
                          callNext(context, Ageselection());
                        }
                  },
                    "Next"
                ),
              )
            ],
          )
      ),
    );
  }
}
