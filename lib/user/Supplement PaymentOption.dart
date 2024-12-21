import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/SupplePaymentComplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Payment Page.dart';

class SupplePaymentOpation extends StatelessWidget {
  final suppleImage;
  final suppleName;
  final suppleBrand;
  final supplePrice;
  SupplePaymentOpation({
    required this.suppleImage,
    required this.suppleName,
    required this.suppleBrand,
    required this.supplePrice,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AdminProvider>(
        builder: (context2,value2,child) {
          return Consumer<Userprovider>(
              builder: (context1,value1,child) {
                return bodyContainer(height, width,
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height/16.45,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width/23.45),
                            child: GestureDetector(
                              onTap: () {
                                back(context);
                              },
                              child: Container(
                                width: width/7.45,
                                height: height/20.45,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.20),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/image/Backarow.png"),scale: 4.20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          appbarText("Payment Option",width/18.84),
                          Container(
                            width:width/6.56
                          )
                        ],
                      ),
                      SizedBox(height: height/14.67,),
                      paymentContainer(
                          text: "Debit / Credit Card",
                          image: "assets/image/card.png",
                          height: height,
                          width: width,
                          Imagesize: 4,
                          boxWidth: width/3.10,
                          ontap: (){
                            value2.addBookingItem(suppleImage, suppleName, suppleBrand, supplePrice);
                            callNextReplacement(context, Supplepaymentcomplete(
                              suppleImage: suppleImage,
                              suppleName: suppleName,
                              suppleBrand: suppleBrand,
                              supplePrice: supplePrice,
                            ));
                          }
                      ),
                      SizedBox(height: height/50.67,),
                      paymentContainer(
                          text: "Internet Banking",
                          image: "assets/image/intrbank.png",
                          height: height,
                          width: width,
                          Imagesize: width/100.45,
                          boxWidth: width/2.90,
                          ontap: (){
                            value2.addBookingItem(suppleImage, suppleName, suppleBrand, supplePrice);
                            callNextReplacement(context, Supplepaymentcomplete(
                              suppleImage: suppleImage,
                              suppleName: suppleName,
                              suppleBrand: suppleBrand,
                              supplePrice: supplePrice,
                            ));
                          }
                      ),
                      SizedBox(height: height/50.67,),
                      paymentContainer(
                          text: "Google Pay",
                          image: "assets/image/upi.png",
                          height: height,
                          width: width,
                          Imagesize: width/150.45,
                          boxWidth: width/2.60,
                          ontap: (){
                            value2.addBookingItem(suppleImage, suppleName, suppleBrand, supplePrice);
                            callNextReplacement(context, Supplepaymentcomplete(
                              suppleImage: suppleImage,
                              suppleName: suppleName,
                              suppleBrand: suppleBrand,
                              supplePrice: supplePrice,
                            ));
                          }
                      ),
                      SizedBox(height: height/50.67,),
                      paymentContainer(
                          text: "Pay Pal",
                          image: "assets/image/paypal 1.png",
                          height: height,
                          width: width,
                          Imagesize: width/170.45,
                          boxWidth: width/1.99,
                          ontap: (){
                            value2.addBookingItem(suppleImage, suppleName, suppleBrand, supplePrice);
                            callNextReplacement(context, Supplepaymentcomplete(
                              suppleImage: suppleImage,
                              suppleName: suppleName,
                              suppleBrand: suppleBrand,
                              supplePrice: supplePrice,
                            ));
                          }
                      ),
                    ],
                  ),
                );
              }
          );
        }
      ),
    );
  }
}
