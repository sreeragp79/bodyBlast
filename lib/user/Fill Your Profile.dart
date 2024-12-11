import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/AppBar%20Texts.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/constants/colors.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:body_blast/user/Address.dart';
import 'package:body_blast/user/Get%20Premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Provider/userProvider.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';
import 'Home Page.dart';
import 'OtpPage.dart';

class FillYourProfile extends StatefulWidget {
  const FillYourProfile({super.key});

  @override
  State<FillYourProfile> createState() => _FillYourProfileState();
}

class _FillYourProfileState extends State<FillYourProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Consumer<Userprovider>(
            builder: (context2,userValue,child) {
              return Consumer<LoginProvider>(
                builder: (context1,proVlaue,child) {
                  return SingleChildScrollView(
                    child: bodyContainer(height, width,
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: height/16.45,),
                            appbarText("Fill Your Profile"),
                            SizedBox(height: height/18.45),
                           Container(
                             height: height/7.20,
                             width: width/1.45,
                             decoration: BoxDecoration(
                               color: CupertinoColors.black,
                               shape: BoxShape.circle,
                              image: userValue.userProfileFile != null
                                 ? DecorationImage(
                                image: FileImage(userValue.userProfileFile!),
                                fit: BoxFit.contain,
                              )
                              : DecorationImage(
                                image: AssetImage('assets/image/user11.png',),scale: 8,
                              ),
                             ),
                             child: Center(
                               child: Transform.translate(
                                 offset: Offset(width/18.34, height/16.45),
                                 child: GestureDetector(
                                   onTap: (){
                                     showModalBottomSheet(
                                         context: context,
                                         backgroundColor: Color(0x381896).withOpacity(1),
                                         builder: (BuildContext context){
                                       return SafeArea(
                                         child:Wrap(
                                           children: [
                                             ListTile(
                                               leading: Icon(Icons.photo_library,color: Colors.white,),
                                               title: Text('Choose from Gallery',
                                               style: TextStyle(
                                                 color: Colors.white
                                               ),
                                               ),
                                               onTap:() {
                                                 userValue.userPickImage(ImageSource.gallery,"userProfileAddImage");
                                                 Navigator.pop(context);
                                               },
                                             ),
                                             ListTile(
                                               leading: Icon(Icons.photo_camera,color: Colors.white,),
                                               title: Text('Take a Photo',
                                                 style: TextStyle(
                                                     color: Colors.white
                                                 ),
                                               ),
                                               onTap:() {
                                                 userValue.userPickImage(ImageSource.camera,"userProfileAddImage");
                                                 Navigator.pop(context);
                                               },
                                             ),

                                           ],

                                         ),
                                       );
                                     }
                                     );
                                   },
                                   child: Container(
                                     height: height/9.45,
                                     width: width/9.45,
                                     decoration: BoxDecoration(
                                       color: Colors.grey,
                                       shape: BoxShape.circle,
                                       image: DecorationImage(
                                         image: AssetImage("assets/image/Camera.png"),scale: 3.67
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                            SizedBox(height: height/15.50,),
                            Container(
                              color: CupertinoColors.white.withOpacity(0.30),
                              width: width/1.17,
                              height:height/999.99,
                            ),
                            SizedBox(height: height/15.45,),
                            Container(
                              width: width/1.17,
                              child: TextFormField(
                                controller: proVlaue.signUpNameController,
                                style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                                decoration: InputDecoration(
                                  hintText: "First Name",
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
                            SizedBox(height: height/15.45,),
                            Container(
                              width: width/1.17,
                              child: TextFormField(
                                controller: proVlaue.lastNameController,
                                style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                                decoration: InputDecoration(
                                  hintText: "Last Name",
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
                            SizedBox(height: height / 18.34,),
                            Container(
                              width: width/1.17,
                              child: TextFormField(
                                controller: proVlaue.emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                                decoration: InputDecoration(
                                  hintText: "Email",
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
                            SizedBox(height: height / 18.34,),
                            Container(
                              width: width/1.17,
                              child: TextFormField(
                                controller: proVlaue.dateOfBirthController,
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                                decoration: InputDecoration(
                                  hintText: "Date Of Birth",
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
                            SizedBox(
                              height: height / 15.20,
                            ),
                            bottonContainer(
                              width / 3.20, height / 18.99,
                                  (){
                                    if (proVlaue.lastNameController.text.isEmpty ||
                                        proVlaue.emailController.text.isEmpty ||
                                        proVlaue.dateOfBirthController.text.isEmpty) {
                                     showCustomSnackBar(context,  'Please Fill Your Details.');
                                    } else {
                                      userValue.saveImageToFireBase("userProfileAddImage");
                                     proVlaue.userFillProfile();
                                      callNextReplacement(context, Address());
                                    }
                                  },
                              "Next >",
                            )
                          ],
                        )
                    ),
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
