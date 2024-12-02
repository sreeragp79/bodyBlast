import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/AppBar%20Texts.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:body_blast/user/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Home Page.dart';
import 'OtpPage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _FillYourProfileState();
}

class _FillYourProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context2,editLogValue,child) {
          return Consumer<Userprovider>(
            builder: (context1,editValue,child) {
              return SingleChildScrollView(
                child: bodyContainer(height, width,
                    Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height/16.45,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width/23.45),
                              child: GestureDetector(
                                onTap: (){
                                  callNext(context, Profile());
                                },
                                child: Container(
                                  width: width/7.45,
                                  height: height/20.45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.30),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/image/Backarow.png"),scale: 4.20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width/5.34,),
                            appbarText("Edit Profile"),
                          ],
                        ),
                        SizedBox(height: height/18.45),
                        Container(
                          height: height/7.20,
                          width: width/1.45,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            image: editValue.userProfileFile != null
                                ? DecorationImage(
                              image: FileImage(editValue.userProfileFile!),
                              fit: BoxFit.contain,
                            )
                                :DecorationImage(
                              image: AssetImage('assets/image/user11.png',),scale: 8
                            ),
                          ),
                          child: Center(
                            child: Transform.translate(
                              offset: Offset(width/18.34, height/16.45),
                              child: GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Color(0x829DE4).withOpacity(1),
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
                                                  editValue.userPickImage(ImageSource.gallery,"userProfileAddImage");
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
                                                  editValue.userPickImage(ImageSource.camera,"userProfileAddImage");
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
                          color: CupertinoColors.white.withOpacity(0.20),
                          width: width/1.17,
                          height:height/999.99,
                        ),
                        SizedBox(height: height/15.45,),
                        Container(
                          width: width/1.17,
                          child: TextFormField(
                            controller: editLogValue.signUpNameController,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                             label: Text("Name"),
                              labelStyle: TextStyle(
                                color: Color(0x448EE4).withOpacity(1),
                                fontSize: 22,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/60.55),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            controller: editLogValue.lastNameController,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              label: Text("Last Name"),
                              labelStyle: TextStyle(
                                color: Color(0x448EE4).withOpacity(1),
                                fontSize: 22,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/60.55),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            keyboardType: TextInputType.emailAddress,
                            controller: editLogValue.emailController,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              label: Text("Email"),
                              labelStyle: TextStyle(
                                color:Color(0x448EE4).withOpacity(1),
                                fontSize: 22,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/60.55),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            keyboardType: TextInputType.datetime,
                            controller: editLogValue.dateOfBirthController,
                            style: TextStyle(color: Colors.white, fontFamily: "interlight"),
                            decoration: InputDecoration(
                              label: Text("Date Of Birth"),
                              labelStyle: TextStyle(
                                color: Color(0x448EE4).withOpacity(1),
                                fontSize: 22,
                                fontFamily: "interlight",
                              ),
                              contentPadding: EdgeInsets.only(bottom: height/60.55),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.50),width: width/999.99,
                                ),
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
                          height: height / 20.20,
                        ),
                        bottonContainer(
                          width / 3.20, height / 18.99,
                              (){
                            editLogValue.updateUserProfile(context);
                              callNext(context, BottomNavigationPage());
                          },
                          "Save",
                        )
                      ],
                    )
                ),
              );
            }
          );
        }
      ),
    );
  }
}
