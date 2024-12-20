import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/CheckOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Supplementsdetails extends StatefulWidget {
  final suppleImage;
  final suppleName;
  final suppleBrand;
  final supplePrice;
   Supplementsdetails({super.key,
   this.suppleImage,
   this.suppleName,
   this.suppleBrand,
   this.supplePrice,
  });

  @override
  State<Supplementsdetails> createState() => _SupplementsdetailsState();
}

class _SupplementsdetailsState extends State<Supplementsdetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(
      builder: (context1,value1,child) {
        return Consumer<AdminProvider>(
          builder: (context,value,child) {
            return Scaffold(
              body: bodyContainer(
                height,
                width,
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        height: height/2.50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.suppleImage),
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/33.45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height/50.56),
                            Text(
                              widget.suppleName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width/17.30,
                                fontFamily: "intersemi",
                              ),
                            ),
                            Text(
                              widget.suppleBrand,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width/28,
                                fontFamily: "interlight",
                              ),
                            ),
                            SizedBox(height: height/99.56),
                            Text(
                              widget.supplePrice,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width/17.30,
                                fontFamily: "interbold",
                              ),
                            ),
                            SizedBox(height: height/66.56),
                            Text(
                              "Better Athletic Performance",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: width/20.5,
                                fontFamily: "intersemi",
                              ),
                            ),
                            SizedBox(height: height/300.56),
                            Text(
                              "Supplemental use of vitamins and minerals is getting the "
                                  "right attention these days. More and more people are "
                                  "getting to try dietary supplements that can keep "
                                  "their bodies active with essential nutrients.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width/24.82,
                                fontFamily: "interlight",
                              ),
                            ),
                            SizedBox(height: height/66.56),
                            Text(
                              "How to Use Creatine",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: width/20.5,
                                fontFamily: "intersemi",
                              ),
                            ),
                            SizedBox(height: height/300.56),
                            Text(
                              "You can buy creatine in either powder or capsule form as a "
                                  "supplement. It is commonly added to sports commonly "
                                  "supplements and protein shakes. Creatine should be "
                                  "consumed with plenty of water. It is most effective for "
                                  "improving athletic performance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width/24.82,
                                fontFamily: "interlight",
                              ),
                            ),
                            SizedBox(height: height/20.56),  // Reduced spacing
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: height/40),  // Added bottom padding
                                child: bottonContainer(
                                    width / 1.70,
                                    height / 17.56,
                                        () {
                                      value.getAddressDetails();
                                      callNextReplacement(context, Checkout(
                                        suppleImage: widget.suppleImage,
                                        suppleName: widget.suppleName,
                                        suppleBrand: widget.suppleBrand,
                                        supplePrice: widget.supplePrice,
                                      ));
                                    },
                                    "Buy Now"
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}
