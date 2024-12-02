import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Fill Your Profile.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  TextEditingController otpController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:bodyContainer(
        height,
        width,
        Padding(
          padding: EdgeInsets.only(left: width / 15.34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 14.34),
              Text(
                "Verification",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "intersemi",
                  color: CupertinoColors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: height / 300.56),
              Text(
                "   Enter the code you received \n   via SMS",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "interelight",
                  color: CupertinoColors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: height / 7.56),
              Pinput(
                controller: otpController,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: width / 7.80,
                  height: height / 14.45,
                  textStyle: TextStyle(
                    fontFamily: "jeju2",
                    fontSize: 23,
                    color: CupertinoColors.white,
                  ),
                  decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                      color:  Colors.white,width: 0.30
                     )
                   )
                  ),
                ),
              ),
              SizedBox(height: height/8.67),
              Padding(
                padding:  EdgeInsets.only(left: width/3.20),
                child: Text(
                  "Sent code again",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "interlight",
                    color:Color(0x6C8FEE).withOpacity(1),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: height/50.45,),
              Padding(
                padding:  EdgeInsets.only(left: width/4.50),
                child: bottonContainer(
                    width / 2.30, height / 18.99,
                    (){
                    callNextReplacement(context, FillYourProfile());
                    },
                    "Verify"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
