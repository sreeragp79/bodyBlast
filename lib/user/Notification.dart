import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Receipt.dart';
import 'Reviews.dart';

class Notifications extends StatelessWidget {
  List<String>image=[
    "assets/image/profileImage.png",
  ];
  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final insItem = Provider.of<Userprovider>(context).bookingDetailsList;
    return Scaffold(
      body: Consumer<Userprovider>(
        builder: (context,value,child) {
          return bodyContainer(height, width,
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
                      SizedBox(width: width/6.34,),
                      appbarText("Notification"),
                    ],
                  ),
                  SizedBox(height: height/20.45,),
                  Expanded(
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: value.bookingDetailsList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: height/40.45),
                              height: height/8.70,
                              width: width/1.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Colors.grey.withOpacity(0.10),
                              ),
                              child:  Padding(
                                padding:  EdgeInsets.only(left: width/79.67),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height/70.45,),
                                    Row(
                                      children: [
                                        Container(
                                          height: height/17.20,
                                          width: width/6.45,
                                          decoration: BoxDecoration(
                                              color: CupertinoColors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                  image: NetworkImage(insItem[index].instructorImage)
                                              )
                                          ),
                                        ),
                                        SizedBox(width: width/47.56,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              insItem[index].notificationSub,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "interlight",
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: height/90.45,),
                                            GestureDetector(
                                              onTap: () {
                                                callNext(context, Receipt(item:value.bookingDetailsList[index],));
                                              },
                                              child: Text(
                                                "See Details...",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "intermedi",
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                ],
              )
          );
        }
      ),
    );
  }
}
