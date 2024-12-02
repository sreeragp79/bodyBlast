import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/constants/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Reviews.dart';

class AddReview extends StatefulWidget {
  AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Userprovider>(
        builder: (context1, value1, child) {
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
                        SizedBox(width: width / 6.34),
                        appbarText("Add Reviews"),
                      ],
                    ),
                    SizedBox(height: height / 30.45),
                    Container(
                      height: height/7.20,
                      width: width/1.45,
                      decoration: BoxDecoration(
                        color: CupertinoColors.black,
                        shape: BoxShape.circle,
                        image: value1.userReviewFile != null
                            ? DecorationImage(
                          image: FileImage(value1.userReviewFile!),
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
                                              value1.userPickImage(ImageSource.gallery,"userReviewAddImage");
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
                                              value1.userPickImage(ImageSource.camera,"userReviewAddImage");
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
                    SizedBox(height: height / 22.56),
                    Container(
                      width: width / 1.37,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.34),
                            width: width / 999.99),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: value1.reviewSubController,
                        maxLines: 10,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "InterLight"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          border: InputBorder.none,
                          hintText: "Add Yout Review",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "interlight",
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 22.56),
                    Padding(
                      padding: EdgeInsets.only(left: width / 99.78),
                      child: Center(
                        child: isLoading
                            ? SizedBox(
                          width: 100,
                          height: 100,
                          child: Lottie.asset(
                            "assets/animation/LoadingAnimation.json",
                          ),
                        )
                            : bottonContainer(
                          width / 1.70,
                          height / 17.56, () async {
                            if(value1.reviewSubController.text.isEmpty){
                              showCustomSnackBar(context, "Add your Review");
                            }else{
                              setState(() {
                                isLoading = true;
                              });
                             await value1.saveImageToFireBase("userReviewAddImage");
                              await Future.delayed(Duration(seconds: 3));
                              value1.reviewAdd(context);
                              setState(() {
                                isLoading = false;
                              });
                              callNextReplacement(context, Reviews());
                            }
                        },
                          "Add",

                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}