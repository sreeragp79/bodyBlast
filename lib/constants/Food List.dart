import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget breakfastList({
required List<String> breakfastName,
required List<String> breakfastImage,
required List<String> foodCal,
required double width,
required double height,
  required void Function(int) ontap,
}){
  return Expanded(
    child: SizedBox(
      height: height/5.45,
      child: Padding(
        padding: EdgeInsets.only(left: width / 20.45),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: breakfastName.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=> ontap(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceOut,
                    margin: EdgeInsets.only(top: height/50.56,),
                    width: width/1.10,
                    height: height/3.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(breakfastImage[index])
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
                SizedBox(height: height/90.56,),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    breakfastName[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    foodCal[index],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}


Widget gainList({
  required List<String> gainName,
  required List<String> gainImage,
  required List<String> gainCal,
  required double width,
  required double height,
  required void Function(int) ontap,
}){
  return Expanded(
    child: SizedBox(
      height: height/5.45,
      child: Padding(
        padding: EdgeInsets.only(left: width / 20.45),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: gainName.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=> ontap(index),
                  child: Container(
                    margin: EdgeInsets.only(top: height/50.56,),
                    width: width/1.10,
                    height: height/3.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(gainImage[index])
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
                SizedBox(height: height/90.56,),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainName[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainCal[index],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
Widget lossListt({
  required List<String> gainName,
  required List<String> gainImage,
  required List<String> gainCal,
  required double width,
  required double height,
  required void Function(int) ontap,
}){
  return Expanded(
    child: SizedBox(
      height: height/5.45,
      child: Padding(
        padding: EdgeInsets.only(left: width / 20.45),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: gainName.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=> ontap(index),
                  child: Container(
                    margin: EdgeInsets.only(top: height/50.56,),
                    width: width/1.10,
                    height: height/3.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(gainImage[index])
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                ),
                SizedBox(height: height/90.56,),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainName[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainCal[index],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
Widget preworkOutListt({
  required List<String> gainName,
  required List<String> preImage,
  required List<String> gainCal,
  required double width,
  required double height,
}){
  return Expanded(
    child: SizedBox(
      height: height/5.45,
      child: Padding(
        padding: EdgeInsets.only(left: width / 20.45),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: gainName.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height/50.56,),
                  width: width/1.10,
                  height: height/3.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(preImage[index])
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                SizedBox(height: height/90.56,),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainName[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 39.45),
                  child: Text(
                    gainCal[index],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "InterLight",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}