import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/admin/Admin%20BottomBar.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:body_blast/user/GenderSelection.dart';
import 'package:body_blast/user/LoginPage.dart';
import 'package:body_blast/user/OtpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<SignUpPage> {
  bool passwordVisible = false;
  bool isOtpLoading = false;
  String adminNumber = "7994152461";
  String adminName = "Admin";
  String adminPass = "000000";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(
      builder: (context1, value,child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Builder(
            builder: (context) {
              return Consumer<LoginProvider>(
                builder: (context1,signValue,child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height/1.87,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/image/SignUpImagee.png")
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(top:height/19.23 ,left: width/16.78),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    callNext(context, Loginpage());
                                  },
                                  child: Text("LogIn",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "intersemi",
                                      fontSize: width/20.55,
                                    ),
                                  ),
                                ) ,
                                SizedBox(width: width/20.32,),
                                Column(
                                  children: [
                                    Text("SignUp",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "intersemi",
                                        fontSize: width/20.55,
                                      ),
                                    ),
                                    SizedBox(height: height/90.34,),
                                    Container(
                                      height: height/405.5,
                                      width: width / 10,
                                      color: Colors.blue,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: width/1.17,
                          child: TextFormField(
                            controller: signValue.signUpNameController ,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: width/27.4,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/40.55),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 25.34,),
                        Container(
                          width: width/1.17,
                          child: TextFormField(
                            controller: signValue.signUpPhoneController ,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              hintText: "Phone",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: width/27.4,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/40.55),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 25.34,),
                        Container(
                          width: width/1.17,
                          child: TextFormField(
                            controller: signValue.signUpPasswordController ,
                            obscureText: !passwordVisible,
                            maxLength: 6,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: width/27.4,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/40.55),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 20.20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width / 14.34),
                          child: Row(
                            children: [
                              Container(
                                height: height / 7.45,
                                width: width / 7.45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/image/Apple Logo .png"),scale: 3.34
                                    ),
                                    color: Color(0xD9D9D9).withOpacity(0.34),
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: width/34.25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Google Sign-In button clicked");
                                  signValue.signInMethod(context);
                                },
                                child: Container(
                                  height: height / 7.45,
                                  width: width / 7.45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/image/Google .png"),scale: 3.34
                                      ),
                                      color: Color(0xD9D9D9).withOpacity(0.34),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              SizedBox(
                                width: width / 3.95,
                              ),
                              isOtpLoading ?
                              SizedBox(
                                width: 130,
                                height: 130,
                                child: Lottie.asset(
                                  "assets/animation/LoadingAnimation.json",
                                ),
                              )
                              :bottonContainer(
                                width / 3.30,
                                height / 18.93,
                                    () async {
                                  FocusScope.of(context).unfocus();

                                  // Check for empty fields
                                  if (signValue.signUpNameController.text.isEmpty ||
                                      signValue.signUpPhoneController.text.isEmpty ||
                                      signValue.signUpPasswordController.text.isEmpty) {
                                    showCustomSnackBar(context, 'Please Fill Your Details.');
                                  } else {
                                    // Check for admin login details
                                    if (signValue.signUpPhoneController.text.trim()== adminNumber &&
                                        signValue.signUpNameController.text.trim() == adminName &&
                                        signValue.signUpPasswordController.text.trim() == adminPass) {
                                      setState(() {
                                        isOtpLoading = true;
                                      });

                                      await Future.delayed(Duration(seconds: 3));

                                      setState(() {
                                        isOtpLoading = false;
                                      });

                                      callNextReplacement(context, AdminBottomBar());
                                    } else {
                                      setState(() {
                                        isOtpLoading = true;
                                      });

                                      await Future.delayed(Duration(seconds: 3));

                                      setState(() {
                                        isOtpLoading = false;
                                      });

                                      callNext(context, Otppage());
                                      await signValue.addUserSignUpDetails();
                                    }
                                  }
                                },
                                "Sign Up",
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            }
          ),
        );
      }
    );
  }
}
