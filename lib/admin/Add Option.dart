import 'dart:io';

import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import '../constants/Update TextField.dart';
import '../constants/bodyContainer.dart';

class AddOption extends StatefulWidget {

   AddOption({super.key});

  @override
  State<AddOption> createState() => _AddOptionState();
}

class _AddOptionState extends State<AddOption> {
  String? selectedCategory ="Select Category";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold (
      body: SingleChildScrollView(
        child: Consumer<AdminProvider>(
          builder: (context1,value1,child) {
            return bodyContainer(height, width,
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height / 16.45),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width / 23.45),
                          child: GestureDetector(
                            onTap: () {
                              back(context);
                            },
                            child: Container(
                              width: width / 7.45,
                              height: height / 20.45,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.20),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/image/Backarow.png"),
                                  scale: 4.20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width / 7.34),
                        appbarText("Add Option"),
                      ],
                    ),
                    SizedBox(height: height / 45.56),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height/3.40,
                          width: width/2.30,
                          decoration: BoxDecoration(
                            image: value1.instructorImageFile != null ?
                            DecorationImage(
                              image: FileImage(value1.instructorImageFile!),
                              fit: BoxFit.cover,
                            )
                            :null,
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo_outlined,color: Colors.white,size: 30,),
                            onPressed: () {
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
                                              value1.adminAddImage(ImageSource.gallery,"adminInstructorImage");
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
                                              value1.adminAddImage(ImageSource.camera,"adminInstructorImage");
                                              Navigator.pop(context);
                                            },
                                          ),
        
                                        ],
        
                                      ),
                                    );
                                  }
                              );
                            },
                          ),
                        ),
                        Container(
                          height: height/3.40,
                          width: width/2.30,
                          decoration: BoxDecoration(
                            image: value1.workOutImageFile != null?
                                DecorationImage(
                                  image: FileImage(value1.workOutImageFile!),
                                  fit: BoxFit.cover
                                )
                            :null,
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo_outlined,color: Colors.white,size: 30,),
                            onPressed: () {
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
                                              value1.adminAddImage(ImageSource.gallery,"adminWorkOutImage");
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
                                              value1.adminAddImage(ImageSource.camera,"adminWorkOutImage");
                                              Navigator.pop(context);
                                            },
                                          ),

                                        ],

                                      ),
                                    );
                                  }
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height/70.56,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("instructor Image",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        ),
                        Text("WorkOut Image",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: height/30.56,),
                    mainTextField(
                        hintText: "instructor Name", width: width,height: height,
                      controller: value1.insNameController
                    ),
                    SizedBox(height: height / 45.56),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        updateTextField(
                            hintText: "Exp",
                            width: width,
                          controller: value1.expController
                        ),
                        SizedBox(width: width/43.54,),
                        updateTextField(
                            hintText: "Medal",
                            width: width,
                            controller: value1.medalController
                        ),
                        SizedBox(width: width/43.54,),
                        updateTextField(
                            hintText: "clint",
                            width: width,
                            controller: value1.clintController
                        ),
                        SizedBox(width: width/43.54,),
                        updateTextField(
                            hintText: "Price",
                            width: width,
                            controller: value1.priceController
                        ),
                      ],
                    ),
                    SizedBox(height: height/50.56,),
                    mainTextField(
                        hintText: "WorkOut Name", width: width,height: height,
                        controller: value1.workOutNameController
                    ),
                    SizedBox(height: height / 45.56),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        updateTextField(
                            hintText: "Mins",
                            width: width,
                            controller: value1.minsController
                        ),
                        SizedBox(width: width/43.54,),
                        updateTextField(
                            hintText: "Cal",
                            width: width,
                            controller: value1.calController
                        ),
                        SizedBox(width: width/43.54,),
                        updateTextField(
                            hintText: "Sets",
                            width: width,
                            controller: value1.setsController
                        ),
                      ]
                    ),
                    // SizedBox(height: height/40.34,),
                    // Container(
                    //   width: 210,
                    //   height:40 ,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     border: Border.all(color: Colors.white.withOpacity(0.60), width: width / 999.99),
                    //     borderRadius: BorderRadius.circular(17),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //          selectedCategory!,
                    //         style: TextStyle(color: Colors.white, fontSize: 16),
                    //       ),
                    //       DropdownButton<String>(
                    //         dropdownColor: Colors.black,
                    //         icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    //         items: <String>['WorkOut', 'Instructor',]
                    //             .map((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Text(value, style: TextStyle(color: Colors.white)),
                    //           );
                    //         }).toList(),
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             selectedCategory = newValue;
                    //           });
                    //           print(newValue);
                    //         },
                    //         underline: SizedBox(),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: height/20.56,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        bottonContainer(
                            width/2.70,
                            height/17.56,
                                (){
                              if(value1.instructorImageFile == null||
                                  value1.insNameController.text.isEmpty||
                                  value1. expController.text.isEmpty||
                                  value1.medalController.text.isEmpty||
                                  value1. clintController.text.isEmpty||
                                  value1.priceController.text.isEmpty
                                ) {
                                showCustomSnackBar(context, "fill your details");
                              }else{
                                value1.saveAdminAddImageToFireBase("adminInstructorImage");
                                value1.clearInstructorField();
                              }
                            },
                            "Add Ins"
                        ),
                        bottonContainer(
                            width/2.70,
                            height/17.56,
                                (){
                                  if(

                                      value1.  workOutImageFile == null||
                                      value1. workOutNameController.text.isEmpty||
                                      value1.minsController.text.isEmpty||
                                      value1. calController.text.isEmpty||
                                      value1. setsController.text.isEmpty) {
                                    showCustomSnackBar(context, "fill your details");
                                  }else{
                                    value1.saveAdminAddImageToFireBase("adminWorkOutImage");
                                    value1.clearWorkOutField();
                                  }
                            },
                            "Add Wor"
                        ),
                      ],
                    ),
                  ],
                ),
            );
          }
        ),
      ),
    );
  }
}
