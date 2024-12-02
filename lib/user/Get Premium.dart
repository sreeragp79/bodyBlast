import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/bodyContainer.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PremiumContainer(width: width,height: height,
             child: Padding(
               padding:  EdgeInsets.only(top: height/17.56,left: width/1.30),
               child: Align(
                 alignment: Alignment.topCenter,
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.grey.withOpacity(0.45),
                     shape: BoxShape.circle
                   ),
                   child: IconButton(
                     icon: Icon(Icons.close,color: Colors.white,size: 34,),
                     onPressed: () {
                       callNextReplacement(context, BottomNavigationPage());
                     },
                   ),
                 ),
               ),
             ) ,
            ),

          ],

        ),
      ),
    );
  }
}
