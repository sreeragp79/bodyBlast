import 'package:body_blast/Provider/adminProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'Bottom Navigation.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Consumer<AdminProvider>(
      builder: (context,value,child) {
        return Scaffold(
          body: bodyContainer(
            height,
            width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    appbarText("Order Details",width/14.84),
                  ],
                ),
                SizedBox(height: height / 33.66),
                Padding(
                  padding: EdgeInsets.only(left: width / 20.56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Track Order",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: "intersemi",
                        ),
                      ),
                      SizedBox(height: height / 55.45),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage(
                            value.bookedSuppleImagesList[value.currentOrderIndex]["image"]??'',
                            ),
                          ),
                          SizedBox(width: width/55.56,),
                          Text(value.bookedSuppleImagesList[value.currentOrderIndex]["name"]??"",
                          style: TextStyle(
                            fontSize: width/28.56,
                            color: Colors.white,
                            fontFamily: "intersemi"
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 77.45),
                      Text(
                        "${value.dayName},${value.date},${value.month}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "intersemi",
                        ),
                      ),
                      SizedBox(height: height / 130.45),
                      Row(
                        children: [
                          Text(
                            "Order Id:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "intersemi",
                            ),
                          ),
                          SizedBox(width: width / 77.56),
                          Text(
                            "777777777",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "intersemi",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 33.45),
                      Text(
                        "Result",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: "intersemi",
                        ),
                      ),
                      // Stepper Added Heare
                      Stepper(
                        currentStep: _currentStep,
                        margin: EdgeInsets.only(bottom: 67),
                        onStepTapped: (step) => setState(() {
                          _currentStep = step;
                        }),
                        steps: [
                          Step(
                            title: Text("Order Placed",style: TextStyle(color: Colors.blue)),
                            content: Text("${value.dayName},${value.date},${value.month}",style: TextStyle(color: Colors.grey),),
                            state: StepState.complete,stepStyle: StepStyle(
                            color: Colors.green,
                          ),
                          ),
                          Step(
                            title: Text("Order Processed",style: TextStyle(color: Colors.blue),),
                            content: Text("Date: Thu, 13 Sep",style: TextStyle(color: Colors.grey)),
                            state: StepState.indexed,
                          ),
                          Step(
                            title: Text("Shipped",style: TextStyle(color: Colors.blue)),
                            content: Text("Date: Fri, 14 Sep",style: TextStyle(color: Colors.grey)),
                            state: StepState.indexed,
                          ),
                          Step(
                            title: Text("Delivered",style: TextStyle(color: Colors.blue)),
                            content: Text("Date: Sat, 15 Sep",style: TextStyle(color: Colors.grey)),
                            state: StepState.indexed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
