import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'PaymentCompleted.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: bodyContainer(
          height,
          width,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height / 16.45,
            ),
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
                SizedBox(
                  width: width / 4.70,
                ),
                appbarText("Receipt"),
              ],
            ),
            SizedBox(
              height: height / 13.45,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15.34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Text(
                      "Order Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "intermedi",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 45.45,
                  ),
                  Container(
                    width: width / 1.15,
                    height: height / 999.37,
                    color: Colors.white.withOpacity(0.10),
                  ),
                  SizedBox(height: height/45.54,),
                  Row(
                      children: [
                        Container(
                          height: height / 10.81,
                          width: width / 5.48,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/rose1.png"),
                              )
                          ),
                        ),
                        SizedBox(
                          width: width / 25.45,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rose",
                              style: TextStyle(
                                  fontFamily: "jeju",
                                  height: height / 800.99,
                                  fontSize: 24,
                                  color: CupertinoColors.white),
                            ),
                            experience("High Intensity Trainer"),
                          ],
                        ),
                      ]
                  ),
                  SizedBox(height: height/35.54,),
                  Container(
                    width: width / 1.15,
                    height: height / 999.37,
                    color: Colors.white.withOpacity(0.10),
                  ),
                  SizedBox(height: height/53.54,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Text(
                      "Date",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.56),
                        fontFamily: "intermedi",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height/400.54,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Text(
                      "20 October - Monday",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "interlight",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height/30.54,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Text(
                      "Time",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.56),
                        fontFamily: "intermedi",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height/400.54,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Text(
                      "9;30 Am",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "interlight",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height/35.54,),
                  Container(
                    width: width / 1.15,
                    height: height / 999.37,
                    color: Colors.white.withOpacity(0.10),
                  ),
                  SizedBox(height: height/25.54,),
                  Padding(
                    padding: EdgeInsets.only(left: width / 34.45),
                    child: Row(
                      children: [
                        Text(
                          "Estimate Cost",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.70),
                            fontFamily: "intermedi",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: width/2.34,),
                        Text(
                          "\$170.55",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "intermedi",
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height/23.54,),
                  Container(
                    width: width / 1.15,
                    height: height / 999.37,
                    color: Colors.white.withOpacity(0.10),
                  ),

                ],
              ),
            ),
          ]
          ),
        )
    );
  }
}
