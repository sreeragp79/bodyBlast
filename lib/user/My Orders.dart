import 'package:body_blast/Provider/adminProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../constants/bodyContainer.dart';
import 'Bottom Navigation.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<AdminProvider>(
      builder: (context1,value,child) {
        return Scaffold(
            body: bodyContainer(
          height,
          width,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                SizedBox(width: width / 5.34),
                appbarText("My Orders"),
              ],
            ),
            SizedBox(height: height/20.45,),
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: value.supplementsBookingList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var item = value.supplementsBookingList[index];
                  return
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: width / 400.45),
                        height: height / 7.70,
                        width: 365.70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: width / 26.56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 50.45,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height / 10.81,
                                    width: width / 5.48,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(item.BsupplementImage),
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
                                        item.BsupplementName,
                                        style: TextStyle(
                                            fontFamily: "jeju",
                                            height: height / 800.99,
                                            fontSize: 23,
                                            color: CupertinoColors.white),
                                      ),
                                      experience(item.BsupplementBrand),
                                      SizedBox(
                                        height: height / 67.58,
                                      ),
                                      Text(
                                        item.BsupplementPrice,
                                        style: TextStyle(
                                          fontFamily: "interbold",
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                },
              ),
            ),
          ]
          ),
        )
        );
      }
    );
  }
}
