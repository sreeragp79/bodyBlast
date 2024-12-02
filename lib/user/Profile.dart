import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:body_blast/user/Edit%20Profile.dart';
import 'package:body_blast/user/SplashScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/AppBar Texts.dart';
import 'LoginPage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<LoginProvider>(
        builder: (context2,prologValue,child) {
          return Consumer<Userprovider>(
            builder: (context1,proValue,child) {
              return bodyContainer(height,width,
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height/16.45,),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width/23.45),
                            child: GestureDetector(
                              onTap: () {
                               callNext(context, BottomNavigationPage());
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
                          SizedBox(width: width/4.34,),
                          appbarText("Profile"),
                        ],
                      ),
                      SizedBox(height: height/28.45),
                      Padding(
                        padding:  EdgeInsets.only(left: width/16.34),
                        child: Row(
                          children: [
                            Container(
                              width: width/3.70,
                              height: height/6.75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: SweepGradient(
                                  colors: [
                                    Color(0x7796E8).withOpacity(1),
                                    Color(0x6141f0).withOpacity(1),
                                    Color(0x2B2929).withOpacity(1), // Gray color
                                  ],
                                  stops: [0.0, 0.3, 1.0],
                                  transform: GradientRotation(-7.14 / 4),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(width/99.2),
                                child: Container(
                                  height: height/40.55,
                                  width: width/20.55,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: height/9.01,
                                      width: width/4.70,
                                      decoration: BoxDecoration(
                                        image: proValue.userProfileFile != null
                                            ? DecorationImage(
                                          image: FileImage(proValue.userProfileFile!),
                                          fit: BoxFit.cover,
                                        )
                                        :DecorationImage(
                                          image: AssetImage('assets/image/userdefault.png'),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.black, // Inner black circle
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width/5.56,),
                            Container(
                              width: width/999.99,
                              height: height/7.37,
                              color: Colors.grey.withOpacity(0.40)
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: width/16.34),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("joind ",
                                    style: TextStyle(
                                      fontFamily: "interexlight",
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.90)
                                    ),
                                  ),
                                  SizedBox(height: height/99.34,),
                                  Text("2 mo ego ",
                                    style: TextStyle(
                                      fontFamily: "interlight",
                                      fontSize: 20,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width/14.33),
                        child: Text(prologValue.signUpNameController.text,
                          style: TextStyle(
                            fontFamily: "interbold",
                            fontSize: 38,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width/14.33),
                        child: Text(prologValue.lastNameController.text,
                          style: TextStyle(
                            height: 1,
                            fontFamily: "interexlight",
                            fontSize: 42,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: height/26.34,),
                      Padding(
                        padding:  EdgeInsets.only(left: width/12.34),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: CupertinoColors.white.withOpacity(0.10),
                              width: width/1.17,
                              height:height/999.99,
                            ),
                           SizedBox(height: height/25.34,),
                           profileTexts("EditProfile", (){callNext(context, EditProfile());}),
                            SizedBox(height: height/30.34,),
                            Container(
                              color: CupertinoColors.white.withOpacity(0.10),
                              width: width/1.17,
                              height:height/999.99,
                            ),
                            SizedBox(height: height/30.34,),
                            profileTexts("Privacy Policy", (){}),
                            SizedBox(height: height/30.34,),
                            Container(
                              color: CupertinoColors.white.withOpacity(0.10),
                              width: width/1.17,
                              height:height/999.99,
                            ),
                            SizedBox(height: height/30.34,),
                            profileTexts("Settings", (){}),
                            SizedBox(height: height/30.34,),
                            Container(
                              color: CupertinoColors.white.withOpacity(0.10),
                              width: width/1.17,
                              height:height/999.99,
                            ),
                            SizedBox(height: height/16.34,),
                           GestureDetector(
                                  onTap: () {
                                    prologValue.logOut();
                                    prologValue.clearAll();
                                    proValue.clearImage();

                                    callNext(context, Loginpage());
                                  },
                                  child: Text("Log Out",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19,
                                    fontFamily: "interlight",
                                  ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  )
              );
            }
          );
        }
      ),
    );
  }
}
