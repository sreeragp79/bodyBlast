import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:body_blast/user/Home%20Page.dart';
import 'package:body_blast/user/OtpPage.dart';
import 'package:body_blast/user/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<LoginProvider>(
        builder: (context1,logvalue,child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height/1.76,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/LoginImage.png")
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top:height/19.23 ,left: width/16.78),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text("LogIn",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "intersemi",
                                fontSize: 20,
                              ),
                            ),
                              SizedBox(height: height/90.34,),
                              Container(
                                height: height/405.5,
                                width: width / 10,
                                color: Colors.blue,
                              ),
                          ],
                        ) ,
                        SizedBox(width: width/20.32,),
                        InkWell(
                          onTap: (){
                            callNext(context, SignUpPage());
                          },
                          child: Text("SignUp",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "intersemi",
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width/1.17,
                  child: TextFormField(
                    controller: logvalue.logInNameController,
                    style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
                SizedBox(height: height / 15.34,),
                Container(
                  width: width/1.17,
                  child: TextFormField(
                    controller: logvalue.logInPasswordController,
                    obscureText: !passwordVisible,
                    maxLength: 6,
                    style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                    decoration: InputDecoration(
                      hintText: "Pssword",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
                SizedBox(height: height/90.34,),
                Padding(
                  padding: EdgeInsets.only(left: width / 1.60),
                  child: Text(
                    "Forgot Password ",
                    style: TextStyle(
                        color: Color(0x818181).withOpacity(1),
                        fontSize: 15,
                        fontFamily: "interlight"),
                  ),
                ),
                SizedBox(
                  height: height / 18.20,
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
                          logvalue.signInMethod(context);
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
                      bottonContainer(
                          width / 3.30, height / 18.93, () {
                            if(logvalue.logInNameController.text.isEmpty ||
                                logvalue.logInPasswordController.text.isEmpty){
                             showCustomSnackBar(context, 'Please Fill Your Details.');
                            }else{
                             String name = logvalue.logInNameController.text;
                             String password = logvalue.logInPasswordController.text;
                             logvalue.checkUser(context,name, password);
                             logvalue.loadUserDetails(context);
                            }

                      },
                        "Log In >",
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
