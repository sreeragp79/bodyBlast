import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/constants/Update%20TextField.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Get%20Premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String? selectedContainer;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AdminProvider>(
          builder: (context,value,child) {
            return bodyContainer(height, width,
              Column(
                children: [
                  SizedBox(height: height / 16.45),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 23.45),
                        child: GestureDetector(
                          onTap: () {
                            callNext(context, BottomNavigationPage());
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
                      SizedBox(width: width / 4.34),
                      appbarText("Address"),
                    ],
                  ),
              SizedBox(height: height/22.56,),
               addressTextField(
                 controller: value.addressNameController,
                   labelText: "Name", width: width/1.20, height: 55,
               ),
                  SizedBox(height: height/33.56,),
               addressTextField(
                 controller: value.addressPhoneController,
                   labelText: "Phone", width: width/1.20, height: 55,
               ),
                  SizedBox(height: height/22.56,),
               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   addressTextField(
                       labelText: "Pincode", width: width/2.88, height: 55,
                     controller: value.pincodeController
                   ),
                   GestureDetector(
                     onTap: () {
                       value.fetchUserLocation();
                     },
                     child: Container(
                       height: height/25.67,
                       width: width/2.77,
                       decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(6),
                       ),
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Icon(Icons.my_location,color: Colors.white,size: 20,),
                           Text("use my location",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 15,
                             fontFamily: "intersemi",
                           ),
                           )
                         ],
                       ),
                     ),
                   )
                 ],
               ),
                  SizedBox(height: height/33.56,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      addressTextField(
                        labelText: "State", width: width/2.88, height: 55,
                          controller: value.stateController
                      ),
                      addressTextField(
                        labelText: "City", width: width/2.88, height: 55,
                          controller: value.cityController,
                      ),
                    ],
                  ),
                  SizedBox(height: height/22.56,),
                  addressTextField(
                    controller: value.addressHouseNoController,
                    labelText: "House No., Building Name", width: width/1.20, height: 55,
                  ),
                  SizedBox(height: height/33.56,),
                  addressTextField(
                    controller: value.addressRoadController,
                    labelText: "Road name, Area", width: width/1.20, height: 55,
                  ),
                  SizedBox(height: height/33.56,),
                  Padding(
                    padding:  EdgeInsets.only(right: width/1.66),
                    child: Text("Type of address",
                    style:TextStyle(
                      color: Colors.grey,
                      fontFamily: "interlight",
                      fontSize: 15,
                    ),
                    ),
                  ),
                  SizedBox(height: height/55.56,),
                  Padding(
                    padding:  EdgeInsets.only(left: width/12.66),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = "Home";
                            });
                          },
                          child: Container(
                            height: height/25.67,
                            width: width/3.77,
                            decoration: BoxDecoration(
                              color: selectedContainer == "Home"? Colors.blue:Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white,width: 0.14)
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.home ,color: Colors.white,size: 20,),
                                Text("Home",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "intersemi",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width/22.56,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainer = "Work";
                            });
                          },
                          child: Container(
                            height: height/25.67,
                            width: width/3.77,
                            decoration: BoxDecoration(
                                color: selectedContainer == "Work" ? Colors.blue:Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white,width: 0.14)
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.warehouse_rounded ,color: Colors.white,size: 20,),
                                Text("Work",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "intersemi",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height/22.56,),
                  bottonContainer(
                      width / 1.22,
                      height / 17.56,
                          ()async{
                            FocusScope.of(context).unfocus();
                            if(value != null){
                              await value.addAddressDetails();
                            }else{
                              print("Address value is null!");
                            }
                        callNextReplacement(context, Premium());
                      },
                      "Save Address"
                  ),
                ],
              )
            );
          }
        ),
      ),
    );
  }
}
