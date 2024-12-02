import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/admin/WorkOut%20List.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../constants/Update TextField.dart';

class WorkOutUpdate extends StatefulWidget {
  final String workoutName;
  final String workoutImage;
  final String mins;
  final String cals;
  final String sets;
  final String workOutId;
  const WorkOutUpdate({super.key,
    required this.workoutName,
    required this.workoutImage,
    required this.mins,
    required this.cals,
    required this.sets,
    required this.workOutId,
  });

  @override
  State<WorkOutUpdate> createState() => _WorkOutUpdateState();
}

class _WorkOutUpdateState extends State<WorkOutUpdate> {
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
   final adminProvider =  Provider.of<Adminprovider>(context, listen: false);
   adminProvider.workOutNameController.text = widget.workoutName;
    adminProvider.minsController.text = widget.mins;
    adminProvider.calController.text = widget.cals;
    adminProvider.setsController.text = widget.sets;
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Adminprovider>(
        builder: (context,value,child) {
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
                      SizedBox(width: width / 8.34),
                      appbarText("WorkOut Update"),
                    ],
                  ),
                  SizedBox(height: height / 45.56),
                  Container(
                    height: height/4.34,
                    width: width/1.30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      image: DecorationImage(
                        image: value.selectedWorkOutImageFile != null
                            ? FileImage(value.selectedWorkOutImageFile!)
                            :NetworkImage(widget.workoutImage),
                      )
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 66,),
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
                                        value.adminAddImage(ImageSource.gallery,"adminWorkOutImage");
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
                                        value.adminAddImage(ImageSource.camera,"adminWorkOutImage");
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
                  SizedBox(height: height / 45.56),
                  mainTextField(hintText: "Name", width: width,height: height,
                  controller: value.workOutNameController
                  ),
                  SizedBox(height: height / 45.56),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      updateTextField(
                          hintText: "mins",
                          width: width,
                        controller: value.minsController
                      ),
                      SizedBox(width: width/43.54,),
                      updateTextField(
                          hintText: "cals",
                          width: width,
                          controller: value.calController
                      ),
                      SizedBox(width: width/43.54,),
                      updateTextField(
                          hintText:  "sets",
                          width: width,
                          controller: value.setsController
                      ),
                    ],
                  ),
                  SizedBox(height: height/20.56,),
                  Center(
                    child: isLoading
                        ? SizedBox(
                      width: 100,
                      height: 100,
                      child: Lottie.asset(
                        "assets/animation/LoadingAnimation.json",
                      ),
                    )
                   :bottonContainer(
                      width/1.70,
                      height/17.56,
                          ()async{
                        setState(() {
                          isLoading = true;
                        });
                         await value.workOutUpdate(widget.workOutId);
                        setState(() {
                          isLoading = false;
                        });
                        callNextReplacement(context, WorkOutList());
                      },
                      "Update"
                  ),
                  ),
                ],
              ),
          );
        }
      ),
    );
  }
}
