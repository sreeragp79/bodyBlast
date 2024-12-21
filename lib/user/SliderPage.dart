import 'package:body_blast/constants/BottonContainer.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/smoothPageIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'GenderSelection.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  PageController pageController = PageController(); 

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return PageView(
      controller: pageController,
      children: [
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/image/page 1 - 10.png"),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height/ 1.04,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width/1.64),
                  child: smoothIndicator(pageController),
                ),
              ],
            )),
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/image/page2.png"),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height/1.04,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width/1.64),
                  child: smoothIndicator(pageController),
                ),
              ],
            )
            ),
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/image/page3.png"))),
            child: Column(
              children: [
                SizedBox(
                  height: height / 1.10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    smoothIndicator(pageController),
                    SizedBox(width: width/45.6,),
                    bottonContainer(
                      width / 3.30,
                      height / 18.93,
                      (){
                        callNextReplacement(context, Genderselection());
                       },
                      "Start Now",
                    )
                  ],
                ),

              ],
            )
        ),
      ],
    );
  }
}