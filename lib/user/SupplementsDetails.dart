import 'package:body_blast/Provider/adminProvider.dart';
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
    return Consumer<AdminProvider>(
      builder: (context,value,child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: bodyContainer(height, width,
            Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: height/50.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    widget.suppleName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "intersemi",
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    widget.suppleBrand,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: "interlight",
                    ),
                  ),
                ),
                SizedBox(height: height/99.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    widget.supplePrice,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "interbold",
                    ),
                  ),
                ),
                SizedBox(height: height/66.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                   "Better Athletic Performance",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontFamily: "intersemi",
                    ),
                  ),
                ),
                SizedBox(height: height/300.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    "Supplemental use of vitamins and minerals is getting the  \n"
                        "right attention these days. More and more people are \n"
                        "getting curious to try dietary supplements that can keep\n"
                        "their bodies active with essential nutrients.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: "interlight",
                    ),
                  ),
                ),
                SizedBox(height: height/66.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    "How to Use Creatine",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontFamily: "intersemi",
                    ),
                  ),
                ),
                SizedBox(height: height/300.56,),
                Padding(
                  padding:  EdgeInsets.only(left: width/33.45),
                  child: Text(
                    "You can buy creatine in either powder or capsule form as a\n"
                        "supplement. It is commonly added to sports commonly\n"
                        "supplements and protein shakes. Creatine should be \n"
                        "consumed with plenty of water. It is most effective for\n"
                        "improving athletic performance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: "interlight",
                    ),
                  ),
                ),
                SizedBox(height: height/10.56,),
                Center(
                  child: bottonContainer(
                      width / 1.70,
                      height / 17.56,
                      (){
                        value.getAddressDetails();
                    callNext(context, Checkout(
                        suppleImage: widget.suppleImage,
                        suppleName: widget.suppleName,
                        suppleBrand: widget.suppleBrand,
                        supplePrice: widget.supplePrice,
                    ));
                      },
                      "Buy Now"
                  ),
                )
              ],
            )
            ),
          ),
        );
      }
    );
  }
}
