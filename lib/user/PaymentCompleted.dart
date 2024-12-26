import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Home%20Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';
import 'InsPaymentOption.dart';

class Paymentcompleted extends StatelessWidget {
  final image;
  final name;
  final price;
  const Paymentcompleted({super.key,required this.image,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Consumer<Userprovider>(
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
                                fontSize: width/16.44,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height/45.70,),
                        Text(
                          "You’ve book a new appointment\n"
                              "with your trainer",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "interlight",
                            fontSize: width/22.83,
                          ),
                        ),
                        SizedBox(height: height/27.70,),
                        Container(
                          height: 210,
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
                                              image: NetworkImage(image),
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
                                            name,
                                            style: TextStyle(
                                                fontFamily: "jeju",
                                                height: height / 800.99,
                                                fontSize: width/18.68,
                                                color: CupertinoColors.white),
                                          ),
                                          experience("High Intensity Trainer"),
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
                                SizedBox(height: height/90.54,),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/34.45),
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(0.56),
                                      fontFamily: "intermedi",
                                      fontSize: width/29.35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/400.54,),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/34.45),
                                  child: Text(
                                    "${value.day?? ''} ${value.month?? ''}-${value.dayName?? ''}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "interlight",
                                      fontSize: width/31.61,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/50.54,),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/34.45),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Time",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.56),
                                          fontFamily: "intermedi",
                                          fontSize: width/29.35,
                                        ),
                                      ),
                                      SizedBox(width: width / 7.50,),
                                      Text(
                                        "To",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "interlight",
                                          fontSize: width/34.25,
                                        ),
                                      ),
                                      SizedBox(width: width / 7.40,),
                                      Text(
                                        "Time",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.56),
                                          fontFamily: "intermedi",
                                          fontSize: width/29.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height/400.54),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/34.45),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${value.time?? ''}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "interlight",
                                          fontSize: width/31.61,
                                        ),
                                      ),
                                      SizedBox(width: width / 3.80,),
                                      Text(
                                        "${value.toTime?? ''}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "interlight",
                                          fontSize:  width/31.61,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/17.54,),
                        Padding(
                          padding:  EdgeInsets.only(left: width/10.78),
                          child: bottonContainer(
                              width/1.70,
                              height/17.56,
                                  (){
                                callNextReplacement(context, BottomNavigationPage());
                              },
                              "Done"
                          ),
                        ),
                      ],
                    ),
                  )
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
