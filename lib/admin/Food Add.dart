import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import '../constants/Update TextField.dart';
import '../constants/snackBar.dart';

class Foodadd extends StatefulWidget {
  Foodadd({super.key});

  @override
  State<Foodadd> createState() => _FoodaddState();
}

class _FoodaddState extends State<Foodadd> {
  String? selectedCategory = "Select Category";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AdminProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: bodyContainer(
              height,
              width,
              Column(
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
                      SizedBox(width: width / 5.34),
                      appbarText("Food Add",width/18.84),
                    ],
                  ),
                  SizedBox(
                    height: height / 40.56,
                  ),
                  Container(
                    width: 230,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.60),
                          width: width / 999.99),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedCategory!,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Colors.black,
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                          items: <String>[
                            'BreackFast',
                            'Gain',
                            'Loss',
                            'Preworkout'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                            print(newValue);
                          },
                          underline: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 20.56),
                  Container(
                    height: height / 4.34,
                    width: width / 1.30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: selectedCategory == 'BreackFast' &&
                              value.breackFastFoodImageFile != null
                          ? DecorationImage(
                              image: FileImage(value.breackFastFoodImageFile!))
                          : selectedCategory == 'Gain'&&
                                  value.gainFoodImageFile != null
                              ? DecorationImage(
                                  image: FileImage(value.gainFoodImageFile!))
                              : selectedCategory == 'Loss' &&
                                      value.lossFoodImageFile != null
                                  ? DecorationImage(
                                      image:
                                          FileImage(value.lossFoodImageFile!))
                                  : selectedCategory == 'Preworkout' &&
                                          value.preworkOutFoodImageFile != null
                                      ? DecorationImage(
                                          image: FileImage(
                                              value.preworkOutFoodImageFile!))
                                      : null,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.black,
                        size: 66,
                      ),
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
                                          ImageSource.gallery, selectedCategory!);
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
                                          ImageSource.camera, selectedCategory!);
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
                  mainTextField(
                      hintText: "Food Name",
                      width: width,
                      height: height,
                      controller: value.foodNameController),
                  SizedBox(height: height / 45.56),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      updateTextField(
                          hintText: "Cal",
                          width: width,
                          controller: value.calorieController),
                      SizedBox(
                        width: width / 43.54,
                      ),
                      updateTextField(
                          hintText: "Protein",
                          width: width,
                          controller: value.proteinController),
                      SizedBox(
                        width: width / 43.54,
                      ),
                      updateTextField(
                          hintText: "Cabs",
                          width: width,
                          controller: value.cabsController),
                      SizedBox(
                        width: width / 43.54,
                      ),
                      updateTextField(
                          hintText: "Fat",
                          width: width,
                          controller: value.fatController),
                    ],
                  ),
                  SizedBox(
                    height: height / 20.56,
                  ),
          GestureDetector(
                    child:value.isLoading
                        ? SizedBox(
                      height: 130,
                      width: 130,
                      child: Lottie.asset(
                        "assets/animation/LoadingAnimation.json",
                        fit: BoxFit.cover,
                      ),
                    )
                    :Container(
                      width: width / 1.70,
                      height: height / 17.56,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x6348ef).withOpacity(1),
                              Color(0x748ce9).withOpacity(
                                  1), // Hexadecimal color with full opacity
                            ],
                            // stops: [0.1, 1],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                        child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: "intermedi",
                                      decoration: TextDecoration.none),
                                ),
                      ),
                    ),
                    onTap: () async {

                      FocusScope.of(context).unfocus();

                      if (value.foodNameController.text.isEmpty ||
                          value.calorieController.text.isEmpty ||
                          value.proteinController.text.isEmpty ||
                          value.cabsController.text.isEmpty ||
                          value.fatController.text.isEmpty) {
                        showCustomSnackBar(context, "fill your details");
                      } else {
                        value.isLoading =true;
                        value.notifyListeners();

                        value.getCategory();
                        await value.addFood(selectedCategory!);
                        value.isLoading =false;
                        value.notifyListeners();
                        value.clearFoodField();
                      }
                    },
                  ),
                ],
              )),
        );
      }),
    );
  }
}
