import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: bodyContainer(height, width,
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
                  appbarText("Privacy Policy",width/18.84),
                  Container(
                    width: width/5.45,
                  )
                ],
              ),
              SizedBox(height: height/27.45,),
              Padding(
                padding:  EdgeInsets.only(left: width/34.56),
                child: Image.asset("assets/image/privacyPolicy.png",scale: 3.70,),
              ),
              SizedBox(height: height/20.45,),
              bottonContainer(
                width / 1.30,
                height / 17.44, (){
               callNextReplacement(context, Profile());
              },
                "I’ve accepted this",

              ),
            ],
          )
      ),
    );
  }
}
