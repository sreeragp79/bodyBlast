import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/Provider/userProvider.dart';
import 'package:body_blast/constants/AppBar%20Texts.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/ChooseWorkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChatScreen.dart';
import 'Instructor.dart';
import 'Notification.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  late AnimationController bounceController;
  late Animation<double> bounceAnimation;

  List<String> image=[
    "assets/image/rope.png",
    "assets/image/dumbelexre.png",
    "assets/image/pullup.png",
    "assets/image/mountain.png",
  ];
  List<String> StatusImage=[
    "assets/image/372 kcl.png",
    "assets/image/7 kcl.png",
    "assets/image/200 kcl.png",
  ];
  List<String> line=[
    "assets/image/66.png",
    "assets/image/76.png",
    "assets/image/76.png",
    "assets/image/76.png",
  ];
  List<String> name1 = [
    "Battle Rope",
    "Dumble",
    "Pull Up",
    "Mountain",
  ];
  List<String> name2 = [
    "Exercise",
    "Exercise",
    "Exercise",
    "Exercise",
  ];
  List<String> menu = [
    "Cardio",
    "Strength ",
    "Agility",
    "Meditation",
    "Biceps",
    "Supplements",
    "Diet",
  ];
  List<String> menuImage = [
    "assets/image/Heart_01.png",
    "assets/image/dumbel.png",
    "assets/image/runer.png",
    "assets/image/meditation 1.png",
    "assets/image/biceps 1.png",
    "assets/image/supplement-bottle 1.png",
    "assets/image/diet 1.png",
  ];
  List<String> TrainerImage = [
    "assets/image/jacke.jpg",
    "assets/image/rose.png",
    "assets/image/knox.png",
    "assets/image/mia.jpg",
  ];
  List<String> TrainerName = [
    "Jake",
    "Rose",
    "Knox",
    "Mia",
  ];
  List<String> Experience = [
    "15 Year Experience",
    "7 Year Experience",
    "13 Year Experience",
    "7 Year Experience",
  ];
  List<String> price = [
    "\$40",
    "\$50",
    "\$30",
    "\$60",
  ];


  @override
  void initState() {
    super.initState();

    // Add this animation initialization
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -15)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -15, end: 0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 50,
      ),
    ]).animate(bounceController);

    startPeriodicAnimation();
  }

  // Add this new method
  void startPeriodicAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        bounceController.forward(from: 0).then((_) {
          if (mounted) {
            startPeriodicAnimation();
          }
        });
      }
    });
  }
  @override
  void dispose() {
    bounceController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Consumer<Userprovider>(
            builder: (context2,value2,child) {
              return Consumer<LoginProvider>(
                builder: (context1,value1,child) {
                  return bodyContainer(height, width,
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height/17.45,),
                          Padding(
                            padding:  EdgeInsets.only(left: width/20.34),
                            child: Row(
                              children: [
                                headingText("HELLO,${value1.signUpNameController.text}"),
                                SizedBox(width: width/4.20,),
                                GestureDetector(
                                  onTap: () {
                                    value2.getBookingDetails();
                                    callNext(context, Notifications());
                                  },
                                  child: Container(
                                    width: width/7.45,
                                    height: height/20.45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.30),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage("assets/image/bellBotton.png"),scale: width/89.34,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/20.34),
                            child: Row(
                              children: [
                                Text("Good Work! Your progress is on the track",
                                  style: TextStyle(
                                      fontFamily: "interlight",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height/40.45,),
                          Padding(
                            padding: EdgeInsets.only(left: width/19.34),
                            child: Text("Continue Activities",
                              style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 20,
                                  fontFamily: "interlight",
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              callNext(context, ChooseWorkout());
                            },
                            child: Container(
                              height: height/4.80,
                              width: width,
                              color: Colors.transparent,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: image.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: width / 27.34, right: width / 3.30), // Adjusted padding
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: height/49.34),
                                      height: height/18.45,
                                      width: width/2.80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(image[index]
                                          ),
                                        ),
                                      ),
                                      child: Transform.translate(
                                        offset: Offset(width/3.90,height/90.45),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,  // Take minimum vertical space
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              name1[index],
                                              style: TextStyle(
                                                height: 1,
                                                fontFamily: "intermedi",
                                                color: Colors.white,
                                                fontSize: 32,
                                              ),
                                            ),
                                            Text(
                                              name2[index],
                                              style: TextStyle(
                                                height: 1,
                                                fontFamily: "intermedi",
                                                color: Colors.white,
                                                fontSize:  32,
                                              ),
                                            ),
                                            SizedBox(height: height/160.34,),
                                            Image.asset(line[index],scale: 4,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: height/90.34),
                          SizedBox(
                            height: height / 6.99,
                              child: ListView.builder(
                                itemCount: StatusImage.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Container(
                                      margin: EdgeInsets.only(right: width / 15.34),
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x17161D).withOpacity(1),Colors.black,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight
                                        )
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: width/40.34),
                                        child: Container(
                                          height: height/10.34,
                                          width: width/9.45,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/image/weeklyStatus.png"),
                                            )
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      margin: EdgeInsets.only(right: width / 19.34),
                                      height: height/8.11,
                                      width: width/2.417,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: AssetImage(StatusImage[index])
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    );
                                  }
                                },
                              ),
                          ),
                          SizedBox(
                            height: height / 6.99,
                            child: Container(
                              child: ListView.builder(
                                itemCount: menuImage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: width/50.34),
                                        child: Container(
                                          width: width/7.10,
                                          height: height/9.11,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(menuImage[index]),scale: 3
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Color(0X201E1E).withOpacity(1),
                                              ],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomCenter,
                                              stops: [0.2, 1],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        menu[index],
                                        style: TextStyle(
                                          height: 0.10,
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'intermedi',
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: width/19.34),
                            child: Row(
                              children: [
                                Text(
                                  "Find instructor ",
                                  style: TextStyle(
                                    height: height/999.99,
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'intermedi',
                                  ),
                                ),
                                SizedBox(width: width/2.80,),
                                InkWell(
                                  onTap: () {
                                    callNext(context, Instructors());
                                  },
                                  child: Text(
                                    "See All",
                                    style: TextStyle(
                                      height: height/999.99,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'intermedi',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height/50.34,),
                          SizedBox(
                            height: height/4.20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: TrainerImage.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: width/30.34),
                                  height: 12.34,
                                  width:170.45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(TrainerImage[index]),
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: width/37.34),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height/70.34,),
                                        Container(
                                          width: width/10.45,
                                          height: height/20.45,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.20),
                                            shape: BoxShape.circle,
                                          ),
                                          child:  Center(
                                            child: Text(
                                              price[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'intermedi',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height/10.34,),
                                        Text(
                                          TrainerName[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: 'jeju',
                                          ),
                                        ),
                                        experience(Experience[index]),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                  );
                }
              );
            }
          ),
        ),
      floatingActionButton: AnimatedBuilder(
        animation: bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, bounceAnimation.value),
            child: FloatingActionButton(
              onPressed: () {
                showPopup(context);
              },
              child: const Icon(
                Icons.mark_chat_unread,
                color: Colors.white,
              ),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}