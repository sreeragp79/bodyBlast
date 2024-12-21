import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Texts.dart';
import 'Appointment.dart';
import 'Reviews.dart';

class InstructorDetails extends StatelessWidget {
  final insImage;
  final insXp;
  final medals;
  final clint;
  final insName;
  final price;
  List<String>name=[
    "Julieta",
    "Clara",
    "July",
  ];
  List<String>rating=[
    "4.8",
    "5.7",
    "8.9",
  ];
  List<String>days=[
    "2d ago",
    "4d ago",
    "1d ago",

  ];
  List<String>image=[
    "assets/image/profileImage.png",
    "assets/image/girl2.jpeg",
    "assets/image/girl3.jpeg",
  ];
  List<String>reviews=[
        " Oh, and two words: Dark Mode.Yes, one of\n"
        " my favorite things about it.And it has\n"
        " a true dark mode.Straight black.\n"
        " Looks great on my",

        "The gym has state-of-the-art equipment\n"
        "knowledgeable trainers,a supportive\n"
        "atmosphere that motivates me to\n"
        "reach my fitness goals",

        "An effective testimonial strongly feature\n"
        "your USP, the thing that you do best\n"
        "An example of a USP for  a Personal"
  ];

   InstructorDetails({
     super.key,required
     this.insImage,
     this.insXp,required
     this.medals,required
     this.clint,required
     this.insName,required
     this.price
   });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<Userprovider>(
        builder: (context,value1,child) {
          return SingleChildScrollView(
            child: bodyContainer(
              height,
              width,
              Column(
                children: [
                  Container(
                    width: width,
                    height: height/2.50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(insImage)
                      )
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: width,
                        height: height/1.10,
                        decoration: BoxDecoration(
                          color:  Color(0x0f0f0f).withOpacity(1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: width/20.34),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height/60.34,),
                              Row(
                                children: [
                                  TrainersName(insName,width/19),
                                  SizedBox(width: width/1.90,),
                                  GestureDetector(
                                    onTap: (){
                                      value1.makePhoneCall(context, '+917994152461');
                                    },
                                      child: Image.asset("assets/image/call.png",scale: 5,)),
                                ],
                              ),
                              experience("High Intensity Trainer"),
                              SizedBox(height: height/34.34,),
                              Container(
                                padding:  EdgeInsets.only(right: width/20.45),
                                height: height/9.99,
                                width: width/1.10,
                                decoration: BoxDecoration(
                                  color:Colors.grey.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: IntrinsicHeight(
                                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildStatColumn("${insXp}","Experience"),
                                      Container(
                                        width: width/999.999,
                                        height: height/16.45,
                                        color: Colors.grey[600],
                                      ),
                                      buildStatColumn('${medals}', 'Medals'),
                                      Container(
                                        width: width/999.999,
                                        height: height/16.45,
                                        color: Colors.grey[600],
                                      ),
                                      buildStatColumn('${clint}', 'Clients'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height/60.34,),
                              Text(
                                "Reviews",
                                style: TextStyle(
                                    fontFamily: "jeju",
                                    fontSize: 15,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(height: height/200.34,),
                              Row(
                                children: [
                                  Image.asset("assets/image/reviewCircle.png",scale: 4.56,),
                                  SizedBox(width: width/2.1,),
                                  GestureDetector(
                                    onTap: () {
                                      callNext(context, Reviews());
                                    },
                                    child: Text(
                                      "See All Reviews",
                                      style: TextStyle(
                                          fontFamily: "jeju",
                                          fontSize: width/27.4,
                                        color:Color(0x448EE4).withOpacity(1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height/56.67,),
                              SizedBox(
                                height:height/5.56
            ,                          child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: name.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return
                                        Container(
                                          margin: EdgeInsets.only(right:width/30.45),
                                          width: width/1.25,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color:Colors.grey.withOpacity(0.10),
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: width/26.56),
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: height/70.45,),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage(image[index]),radius: 21,
                                                    ),
                                                    SizedBox(width: width/25.45,),
                                                    Text(
                                                      name[index],
                                                      style: TextStyle(
                                                        fontFamily: "jeju",
                                                        fontSize: width/25,
                                                       color: CupertinoColors.white
                                                      ),
                                                    ),
                                                    SizedBox(width: width/25.45,),
                                                    Container(
                                                      width: width/14.30,
                                                      height: height/60.56,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(7),
                                                        gradient: LinearGradient(
                                                          colors: [Color(0x5f39f0).withOpacity(1), Color(0xFF7796E8)],
                                                        ),
                                                      ),
                                                      child:  Center(
                                                        child: Text(
                                                          rating[index],
                                                          style: TextStyle(
                                                              fontFamily: "jeju",
                                                              fontSize: 10,
                                                              color: CupertinoColors.white
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: width/3.99,),
                                                    experience(days[index])
                                                  ],
                                                ),
                                                SizedBox(height: height/70.45,),
                                                Container(
                                                  width: width/1.64,
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      reviews[index],
                                                      style: TextStyle(
                                                          fontFamily: "interlight",
                                                          fontSize: width/28,
                                                          color: CupertinoColors.white
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                  },
                                ),
                              ),
                              SizedBox(height: height/26.45,),
                              Padding(
                                padding:  EdgeInsets.only(left: width/7.50),
                                child: bottonContainer(
                                    width/1.60,
                                    height/17.56,
                                        (){
                                     callNext(context, Appointment(
                                       image:insImage,
                                       name: insName,
                                       experience:insXp,
                                       price:price,
                                     ));
                                    },
                                    "Book An Appointment"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
