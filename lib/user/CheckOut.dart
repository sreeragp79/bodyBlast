import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Supplement%20PaymentOption.dart';
import 'package:body_blast/user/Update%20Address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';

class Checkout extends StatefulWidget {
  final suppleImage;
  final suppleName;
  final suppleBrand;
  final supplePrice;
   Checkout({super.key,
     required this.suppleImage,
     required this.suppleName,
     required this.suppleBrand,
     required this.supplePrice,
   });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<AdminProvider>(
      builder: (context,value,child){
        return Scaffold(
          body: bodyContainer(height, width,
          Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: width / 5.34),
                  appbarText("Check Out"),
                ],
              ),
              SizedBox(
                height: height / 30.34,
              ),
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
                                    image: NetworkImage(widget.suppleImage),
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
                                  widget.suppleName,
                                  style: TextStyle(
                                      fontFamily: "jeju",
                                      height: height / 800.99,
                                      fontSize: 23,
                                      color: CupertinoColors.white),
                                ),
                                experience(widget.suppleBrand),
                                SizedBox(
                                  height: height / 67.58,
                                ),
                                Text(
                                  widget.supplePrice,
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
              ),
              SizedBox(height: height/30.56,),
              Padding(
                padding:  EdgeInsets.only(left: width/13.45),
                child: Text(
                  "Shipping Address",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "intersemi",
                  ),
                ),
              ),
              SizedBox(height: height/96.56,),
              Center(
                child: Container(
                  height: height / 7.70,
                  width: 365.70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.10),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width/16.45),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/56.67,),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${value.addressName}\n"
                                  "${value.cityy},${value.pincode}\n"
                                  "${value.rodeName}\n"
                                  "${value.statee}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "intersemi",
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: width/2.99,),
                            GestureDetector(
                              onTap: () {
                                value.getAddressDetails();
                                callNext(context, UpdateAddress());
                              },
                              child: Text("Edit",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: "intersemi",
                                fontSize: 16,
                              ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/33.67,),
              Padding(
                padding:  EdgeInsets.only(left: width/16.45),
                child: Container(
                  height: height / 5.66,
                  width: 365.70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.10),
                    // color: Colors.red,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width/16.45),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/56.67,),
                        Row(
                          children: [
                            Text("Item price",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "intersemi",
                            ),
                            ),
                            SizedBox(width: width/2.24,),
                            Text(widget.supplePrice,
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontFamily: "interBold",
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: height/44.45,),
                        Row(
                          children: [
                            Text("Shipping charge",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: "intersemi",
                              ),
                            ),
                            SizedBox(width: width/2.82,),
                            Text("0",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontFamily: "interBold",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height/38.45,),
                        Row(
                          children: [
                            Text("Total Amount",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "intersemi",
                              ),
                            ),
                            SizedBox(width: width/2.53,),
                            Text(widget.supplePrice,
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.blue,
                                fontFamily: "interBold",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/4.56,),
              Center(
                child: bottonContainer(
                    width / 1.70,
                    height / 17.56,
                        (){
                      value.getAddressDetails();
                      callNext(context, SupplePaymentOpation(
                        suppleImage: widget.suppleImage,
                        suppleName: widget.suppleName,
                        suppleBrand: widget.suppleBrand,
                        supplePrice: widget.supplePrice,

                      ));
                    },
                    "Continue"
                ),
              ),
            ],
          )
          ),
        );
      }
    );
  }
}
