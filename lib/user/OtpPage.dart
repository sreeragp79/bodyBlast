import 'dart:async';

import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../constants/snackBar.dart';
import 'Fill Your Profile.dart';

class Otppage extends StatefulWidget {
   Otppage({super.key,});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  bool isOtpLoading = false;

  int timerSeconds = 30;
  late Timer timer;
  bool resend = false;

  @override
  void initState() {
    super.initState();
    startTimer(); 
  }
  void startTimer() {
    setState(() {
      timerSeconds = 30;
      resend = false;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        setState(() {
          resend = true;
        });
        timer.cancel();
      }
    });
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(
      builder: (context1,value1,child) {
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
                  Container(
                    width: width/2.60,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: "intersemi",
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 300.56),
                  Container(
                    width: width/2.88,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "   Enter the code you received \n   via SMS",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "interelight",
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 7.56),
                  Pinput(
                    controller: value1.otpController,
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
                    padding:  EdgeInsets.only(left: width/2.99),
                    child: GestureDetector(
                      onTap: resend
                      ?(){
                        startTimer();
                      }
                      :null,
                      child: Container(
                        width: width/4.45,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            resend ? "Sent code again" : "Resend code in $timerSeconds s",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "interlight",
                               color: resend
                                ? Color(0x6C8FEE).withOpacity(1)
                                : Colors.grey, // Disable color
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height/50.45,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 4.50),
                    child: isOtpLoading
                        ? Padding(
                          padding:  EdgeInsets.only(left: width/15.57),
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Lottie.asset("assets/animation/LoadingAnimation.json"),
                          ),
                        )
                        : bottonContainer(
                      width / 2.30, height / 18.99,
                          () async {
                        if (value1.otpController.text.isEmpty) {
                          showCustomSnackBar(context, 'Please Fill Code');
                        } else {
                          setState(() {
                            isOtpLoading = true; // Start loading
                          });
                         await  Future.delayed(Duration(seconds: 3));
                          setState(() {
                            isOtpLoading = false;
                          });
                          callNextReplacement(context, FillYourProfile());
                        }
                      },
                      "Verify",
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
