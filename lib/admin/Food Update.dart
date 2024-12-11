import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/admin/Food%20List.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Update%20TextField.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';

class FoodUpdate extends StatefulWidget {
  final foodImage;
  final foodName;
  final foodCalories;
  final foodProtein;
  final foodCarbs;
  final foodFat;
  final foodId;
  final foodCategory;
  const FoodUpdate({super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodCalories,
    required this.foodProtein,
    required this.foodCarbs,
    required this.foodFat,
    required this.foodId,
    required this.foodCategory,
  });

  @override
  State<FoodUpdate> createState() => _FoodUpdateState();
}

class _FoodUpdateState extends State<FoodUpdate> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AdminProvider>(
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
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //   image: NetworkImage(widget.foodImage),
                              //   scale: 4.20,
                              // ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width / 7.34),
                      appbarText("Food Update"),
                    ],
                  ),
                  SizedBox(height: height / 45.56),
                  Container(
                    height: height/4.34,
                    width: width/1.30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: value.selectedFoodImageFile != null
                            ?FileImage(value.selectedFoodImageFile!)
                            :NetworkImage(widget.foodImage)
                      )
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 66,),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Color(0x381896).withOpacity(1),
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.photo_library,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      'Choose from Gallery',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      value.adminAddFoodImage(
                                          ImageSource.gallery, widget.foodCategory!);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.photo_camera,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      'Take a Photo',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      value.adminAddFoodImage(
                                          ImageSource.camera, widget.foodCategory!);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height / 45.56),
                  mainTextField(hintText: widget.foodName, width: width,height: height,
                      controller:value.foodNameController ),
                  SizedBox(height: height / 45.56),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     updateTextField(
                         hintText: widget.foodCalories,
                         width: width,
                       controller: value.calorieController
                     ),
                      SizedBox(width: width/43.54,),
                      updateTextField(
                          hintText:widget.foodProtein,
                          width: width,
                          controller: value.proteinController
                      ),
                      SizedBox(width: width/43.54,),
                      updateTextField(
                          hintText:widget.foodCarbs,
                          width: width,
                          controller:  value.cabsController
                      ),
                      SizedBox(width: width/43.54,),
                      updateTextField(
                          hintText:widget.foodFat,
                          width: width,
                          controller:  value.fatController
                      ),
                    ],
                  ),
                  SizedBox(height: height/20.56,),
               Center(
                 child: isloading
                 ?SizedBox(
                   width: 100,
                   height: 100,
                   child: Lottie.asset(
                     "assets/animation/LoadingAnimation.json",
                   ),
                 )
                 : bottonContainer(
                    width / 1.70,
                    height / 17.56,
                        () async {
                      setState(() {
                        isloading = true;
                      });
                      await value.updateFoodDetails(widget.foodId);
                      value.clearFoodUpdate();
                      await Future.delayed(Duration(seconds: 3));

                      setState(() {
                        isloading = false;
                      });

                      callNextReplacement(context, FoodList());
                    },
                    "Update",
                  ),
          )
                ],
              )
          );
        }
      ),
    );
  }
}
