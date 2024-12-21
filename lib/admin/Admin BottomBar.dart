import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/admin/Admin%20Home.dart';
import 'package:body_blast/admin/Food%20List.dart';
import 'package:body_blast/admin/WorkOut%20List.dart';
import 'package:body_blast/user/Foods.dart';
import 'package:body_blast/user/Home%20Page.dart';
import 'package:body_blast/user/Profile.dart';
import 'package:body_blast/user/ChooseWorkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'AdminMenue.dart';

class AdminBottomBar extends StatefulWidget {
  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<AdminBottomBar> {
  var currentIndex = 0;

  List<String> names = [
    "Home",
    "WorkOuts",
    "Food",
    "Profile",
  ];

  List<String> icons = [
    "assets/image/Home.png",
    "assets/image/workout 2(3).png",
    "assets/image/food.png",
    "assets/image/User.png",
  ];
  List <Widget> pages =[
    AdminHome(),
    WorkOutList(),
    FoodList(),
    Adminmenue(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Consumer<AdminProvider>(
        builder: (context1,value,child) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: pages[currentIndex],
            bottomNavigationBar: Container(
              margin: EdgeInsets.all(width * .05),
              height: width * .155,
              decoration: BoxDecoration(
                color: Color(0x111111).withOpacity(1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * .02),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      HapticFeedback.lightImpact();
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex
                            ? width * .32
                            : width * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == currentIndex ? width * .12 : 0,
                          width: index == currentIndex ? width * .32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? Color(0xB7C6EF).withOpacity(1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex
                            ? width * .31
                            : width * .18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width:
                                  index == currentIndex ? width * .13 : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == currentIndex
                                        ? '${names[index]}'
                                        : '',
                                    style: TextStyle(
                                      color: Color(0x406DE3).withOpacity(1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width:
                                  index == currentIndex ? width * .03 : 20,
                                ),
                                Image.asset(
                                  icons[index],
                                  height: index == 1 ? 30 : (index == 3 ? 32 : 24),
                                  color: index == currentIndex
                                      ? Color(0x406DE3).withOpacity(1)
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          );
        }
    );
  }
}
