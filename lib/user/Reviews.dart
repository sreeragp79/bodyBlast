import 'dart:io';

import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/AddReview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import '../models/class.dart';
import 'Bottom Navigation.dart';

class Reviews extends StatelessWidget {
  List<String>days=[
    "2d ago",
    "4d ago",
    "1d ago",

  ];

   Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Userprovider>(
        builder: (context1,value1,child) {
          return Consumer<LoginProvider>(
            builder: (context2,value2,child) {
              return Consumer<Userprovider>(
                builder: (context1,value1,child) {
                  return bodyContainer(height, width,
                      Column(
                        children: [
                          SizedBox(height: height/16.45,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              appbarText("Reviews",width/14.84),
                                Container(
                                  width: width/5.50,
                                  height: height/20.45,
                                ),
                            ],
                          ),
                          SizedBox(height: height/28.45,),
                          Expanded(
                            child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                              itemCount: value1.reviewsList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                ReviewsClass item = value1.reviewsList[index];
                                return
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: height/40.45),
                                      height: 160,
                                      width: width/1.17,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:Colors.grey.withOpacity(0.10),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: width/26.56),
                                        child: SingleChildScrollView(
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: height/70.45,),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: item.reviewImage.isNotEmpty
                                                        ? NetworkImage(item.reviewImage)
                                                        : AssetImage('assets/image/user11.png'),
                                                  ),
                                                  SizedBox(width: width/25.45,),
                                                  Text(
                                                   item.userName,
                                                    style: TextStyle(
                                                        fontFamily: "jeju",
                                                        fontSize: width/24.17,
                                                        color: CupertinoColors.white
                                                    ),
                                                  ),
                                                  SizedBox(width: width/25.45,),
                                                  SingleChildScrollView(
                                                    child: Container(
                                                      width: width/14.30,
                                                      height: height/60.56,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(7),
                                                        gradient: LinearGradient(
                                                          colors: [Color(0x5f39f0).withOpacity(1), Color(0xFF7796E8)],
                                                        ),
                                                      ),
                                                      child:  Center(
                                                        child: Text(
                                                         "5.7",
                                                          style: TextStyle(
                                                              fontFamily: "jeju",
                                                              fontSize: width/41.1,
                                                              color: CupertinoColors.white
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(width: width/3.99,),
                                                  // experience(item.reviewDate)
                                                ],
                                              ),
                                              SizedBox(height: height/70.45,),
                                              Padding(
                                                padding:  EdgeInsets.only(right: width/8.78),
                                                child: Text(
                                                  item.reviewSub,
                                                  style: TextStyle(
                                                      fontFamily: "interlight",
                                                      fontSize: 16.45,
                                                      color: CupertinoColors.white
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                              },
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/99.78),
                            child: bottonContainer(
                                width/1.70,
                                height/17.56,
                                    (){
                                  callNext(context, AddReview());
                                },
                                "Write a Review "
                            ),
                          ),
                        ],
                      )
                  );
                }
              );
            }
          );
        }
      ),
    );
  }
}
