import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/models/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Provider/adminProvider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import 'instructorDetails.dart';

class Instructors extends StatefulWidget {
  Instructors({super.key});

  @override
  State<Instructors> createState() => _InscrutctorsState();
}

class _InscrutctorsState extends State<Instructors> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final instructorItems = Provider.of<Adminprovider>(context).instructorList; // acess the List

    return Scaffold(
      body: bodyContainer(height, width,
          Column(
            children: [
              SizedBox(height: height/16.45,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width/23.45),
                    child: GestureDetector(
                      onTap: () {
                        back(context);
                      },
                      child: Container(
                        width: width/7.45,
                        height: height/20.45,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.20),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/image/Backarow.png"),scale: 4.20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width/5.34,),
                  appbarText("instructor"),
                ],
              ),
              SizedBox(height: height / 40),
              SizedBox(
                height: height / 1.2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/28),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemCount: (instructorItems.length / 2).ceil(), // row count ആയി മാറ്റുന്നു
                    itemBuilder: (context, rowIndex) {
                      final leftIns = instructorItems[rowIndex * 2];
                      final rightIns = (rowIndex * 2 + 1 < instructorItems.length)
                          ? instructorItems[rowIndex * 2 + 1]
                          : null;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left container
                          GestureDetector(
                            onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor:  Color(0x111111).withOpacity(1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                    child: Container(
                                      height: 180,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 42,),
                                          Container(
                                            height: 48,
                                            width: 200,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Color(0x5f39f0).withOpacity(1), Color(0xFF7796E8)],
                                              ),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  callNextReplacement(context, InstructorDetails(
                                                    insImage: leftIns.instructorImage,
                                                    insXp: leftIns.instructorExp,
                                                    medals: leftIns.instructorMedal,
                                                    clint: leftIns.instructorClint,
                                                    insName: leftIns.instructorName,
                                                    price: leftIns.instructorPrice,

                                                  ));
                                                },
                                                child: Text(
                                                  "Take Appointment",
                                                  style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "interlight"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Center(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "interlight"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                            },
                            child: Container(
                              height: height/3.40,
                              width: width/2.30,
                              margin: EdgeInsets.only(bottom: height / 80.34, right: width / 23),
                              decoration: BoxDecoration(
                                image: DecorationImage(

                                  fit: BoxFit.fill,
                                  image: NetworkImage(leftIns.instructorImage),
                                ),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: width/38.34),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height/90.34,),
                                    Container(
                                      width: width/8.45,
                                      height: height/18.45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.20),
                                        shape: BoxShape.circle,
                                      ),
                                      child:  Center(
                                        child: Text(
                                          "${leftIns.instructorPrice}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'intermedi',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height/6.20,),
                                    TrainersName("${leftIns.instructorName}"),
                                    SizedBox(width: width/7.30,),
                                    Text("${leftIns.instructorExp} Year Experience",
                                      style: TextStyle(
                                        height: height/500.34,
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: "interlight",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Right container (if available)
                          if (rowIndex * 2 + 1 < instructorItems.length)
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor:  Color(0x111111).withOpacity(1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                    child: Container(
                                      height: 180,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 42,),
                                          Container(
                                            height: 48,
                                            width: 200,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [Color(0x5f39f0).withOpacity(1), Color(0xFF7796E8)],
                                              ),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  callNextReplacement(context, InstructorDetails(
                                                    insImage: rightIns.instructorImage,
                                                    insXp: rightIns.instructorExp,
                                                    medals: rightIns.instructorMedal,
                                                    clint: rightIns.instructorClint,
                                                    insName: rightIns.instructorName,
                                                    price: rightIns.instructorPrice,
                                                  ));
                                                },
                                                child: Text(
                                                  "Take Appointment",
                                                  style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "interlight"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Center(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "interlight"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: height/999.34),
                                height: height/4.30,
                                width: width/2.40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(rightIns!.instructorImage),
                                  ),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: width/38.34),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height/90.34,),
                                      Container(
                                        width: width/8.45,
                                        height: height/18.45,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.20),
                                          shape: BoxShape.circle,
                                        ),
                                        child:  Center(
                                          child: Text(
                                            "${rightIns.instructorPrice}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'intermedi',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height/9.80,),
                                      TrainersName(rightIns.instructorName),
                                      SizedBox(width: width/7.30,),
                                      Text("${rightIns.instructorExp} Year Experience",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontFamily: "interlight",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
