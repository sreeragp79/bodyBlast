import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/user/My%20Orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Provider/userProvider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'Bottom Navigation.dart';
import 'Track Order.dart';

class Supplepaymentcomplete extends StatefulWidget {
  final suppleImage;
  final suppleName;
  final suppleBrand;
  final supplePrice;
   Supplepaymentcomplete({super.key,
   this.suppleImage,
    required this.suppleName,
    required this.suppleBrand,
    required this.supplePrice,
  });

  @override
  State<Supplepaymentcomplete> createState() => _SupplepaymentcompleteState();
}

class _SupplepaymentcompleteState extends State<Supplepaymentcomplete> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Consumer<LoginProvider>(
            builder: (context3,value2,child) {
              return Consumer<AdminProvider>(
                builder: (context1,value1,child) {
                  return Consumer<Userprovider>(
                      builder: (context,value,child) {
                        return bodyContainer(height, width,
                            Padding(
                              padding:  EdgeInsets.only(left: width/8.34),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height/3.70,),
                                  Row(
                                    children: [
                                      Container(
                                        width: width/12.20,
                                        height: height/29.45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x6348ef).withOpacity(1),
                                              Color(0x748ce9).withOpacity(1), // Hexadecimal color with full opacity
                                            ],
                                          ),
                                        ),
                                        child: Icon(Icons.done,color: Colors.white,),
                                      ),
                                      SizedBox(width: width/30.56,),
                                      Text(
                                        "Payment Completed!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "intermedi",
                                          fontSize: width/19.6,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height/45.70,),
                                  Text(
                                    "Your order will be delivered\n"
                                        "soon..... ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "interlight",
                                      fontSize: width/25.22,
                                    ),
                                  ),
                                  SizedBox(height: height/27.70,),
                                  Container(
                                    height: height/4.20,
                                    width: width/1.30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color:Colors.grey.withOpacity(0.10),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(left: width/34.56),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: height/70.45,),
                                          Row(
                                              children: [
                                                Container(
                                                  height: height / 15.81,
                                                  width: width / 5.48,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(widget.suppleImage),
                                                      )
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 48.45,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      widget.suppleName,
                                                      style: TextStyle(
                                                          fontFamily: "jeju",
                                                          height: height / 800.99,
                                                          fontSize: width/28.66,
                                                          color: CupertinoColors.white),
                                                    ),
                                                    experience(widget.suppleBrand),
                                                    SizedBox(height: height/300.56,),
                                                    Text(widget.supplePrice,
                                                      style: TextStyle(
                                                        fontSize: width/27.33,
                                                        color: Colors.white,
                                                        fontFamily: "interBold",
                                                      ),
                                                    ),
                                                  ],

                                                ),
                                              ]
                                          ),
                                          SizedBox(height: height/46.54,),
                                          Container(
                                            width: width / 1.55,
                                            height: height / 999.37,
                                            color: Colors.white.withOpacity(0.10),
                                          ),
                                          SizedBox(height: height/55.54,),
                                          Row(
                                            children: [
                                              Text("Delivered on",
                                                style: TextStyle(
                                                  fontSize: width/25.66,
                                                  color: Colors.grey,
                                                  fontFamily: "interlight",
                                                ),
                                              ),
                                              SizedBox(width: width/6.10,),
                                              Text("20 October - Mon",
                                                style: TextStyle(
                                                  fontSize: width/28.66,
                                                  color: Colors.white,
                                                  fontFamily: "interlight",
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height/33.54,),
                                          Row(
                                            children: [
                                              Text("Order Id",
                                                style: TextStyle(
                                                  fontSize: width/25.66,
                                                  color: Colors.grey,
                                                  fontFamily: "interlight",
                                                ),
                                              ),
                                              SizedBox(width: width/4.33,),
                                              Text("143546456456",
                                                style: TextStyle(
                                                  fontSize: width/28.66,
                                                  color: Colors.white,
                                                  fontFamily: "interlight",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height/6.54,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: width/10.78),
                                    child: bottonContainer(
                                        width/1.70,
                                        height/17.56,
                                            (){
                                              value1.getBookingItems();
                                          callNextReplacement(context, MyOrders());
                                        },
                                        "My Odreds"
                                    ),
                                  ),
                                  SizedBox(height: height/55.54,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: width/10.78),
                                    child: bottonContainer(
                                        width/1.70,
                                        height/17.56,
                                            (){
                                          callNextReplacement(context, BottomNavigationPage());
                                        },
                                        "Cancel"
                                    ),
                                  ),
                                ],
                              ),
                            )
                        );
                      }
                  );
                }
              );
            }
          ),
          Positioned(
            // top: height/8.11,
            child: Lottie.asset("assets/animation/success.json",
              width: 400,
              height: 600,
              repeat: false,
            ),
          ),
        ],

      ),
    );
  }
}
