import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../constants/Update TextField.dart';

class InstructorUpdate extends StatefulWidget {
  const InstructorUpdate({super.key});

  @override
  State<InstructorUpdate> createState() => _InstructorUpdateState();
}

class _InstructorUpdateState extends State<InstructorUpdate> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       body: bodyContainer(height, width,
           Column(crossAxisAlignment: CrossAxisAlignment.center,
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
                   SizedBox(width: width / 8.34),
                   appbarText("Instructor Update"),
                 ],
               ),
               SizedBox(height: height / 45.56),
               Container(
                 color: Colors.grey,
                 height: height/4.34,
                 width: width/1.30,
                 child: IconButton(
                   icon: Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 66,),
                   onPressed: () {

                   },
                 ),
               ),
               SizedBox(height: height / 45.56),
               mainTextField(hintText: "Instructor Name", width: width,height: height),
               SizedBox(height: height / 45.56),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   updateTextField(
                       hintText: "Exp",
                       width: width
                   ),
                   SizedBox(width: width/43.54,),
                   updateTextField(
                       hintText: "Medal",
                       width: width
                   ),
                   SizedBox(width: width/43.54,),
                   updateTextField(
                       hintText: "clint",
                       width: width
                   ),
                 ],
               ),
               SizedBox(height: height/20.56,),
               bottonContainer(
                   width/1.70,
                   height/17.56,
                       (){
                     // callNextReplacement(context, Reviews());
                   },
                   "Update"
               ),
             ],
           )
       ),
    );
  }
}
