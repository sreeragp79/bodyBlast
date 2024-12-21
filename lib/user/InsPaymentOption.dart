import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import 'Payment Page.dart';

class Paymentoption extends StatelessWidget {
  final price;
  final image;
  final name;
  const Paymentoption({
    super.key,required
    this.price, required
    this.image,required
    this.name
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Userprovider>(
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
                           Navigator.pop(context);
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
                      appbarText("Payment Option",width/14.84),
                      Container(
                        width: width/7.45,
                        height: height/20.45,
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
                       value1.getDateDetails();
                       callNext(context, Paymentpage(price: price,image:image,name: name,));
                   }
                 ),
                  SizedBox(height: height/50.67,),
                  paymentContainer(
                     text: "Internet Banking",
                     image: "assets/image/intrbank.png",
                     height: height,
                     width: width,
                     Imagesize: 4,
                     boxWidth: width/2.90,
                      ontap: (){
                        value1.getDateDetails();
                        callNext(context, Paymentpage(price: price,image:image,name: name,));
                      }
                 ),
                  SizedBox(height: height/50.67,),
                  paymentContainer(
                     text: "Google Pay",
                     image: "assets/image/upi.png",
                     height: height,
                     width: width,
                     Imagesize: 3,
                     boxWidth: width/2.60,
                      ontap: (){
                        value1.getDateDetails();
                        callNext(context, Paymentpage(price: price,image:image,name: name,));
                      }
                 ),
                  SizedBox(height: height/50.67,),
                  paymentContainer(
                    text: "Pay Pal",
                     image: "assets/image/paypal 1.png",
                     height: height,
                     width: width,
                     Imagesize: 3,
                     boxWidth: width/1.99,
                      ontap: (){
                        value1.getDateDetails();
                        callNext(context, Paymentpage(price: price,image:image,name: name,));
                      }
                 ),
                ],
              ),
          );
        }
      ),
    );
  }
}
