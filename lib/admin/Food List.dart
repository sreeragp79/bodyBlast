import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/admin/Food%20Update.dart';
import 'package:body_blast/constants/Food%20List.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/constants/colors.dart';
import 'package:body_blast/models/class.dart';
import 'package:body_blast/user/FoddDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import '../user/Bottom Navigation.dart';


class FoodList extends StatefulWidget {
  FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  int selecteIndex = 0;

  List<String> category = [
    "Breakfast",
    "Gain",
    "Loss",
    "Preworkout",
    "Postworkout",
  ];
  List<String> preFoodName = [
    "Bananas",
    "Protein Shakes",
    "Protein Bar",
    "Porridge and Oatmeal",
  ];

  List<String> prefoodCal = [
    "768 kcl",
    "690 kcl",
    "400 kcl",
    "500 kcl",
  ];
  List<String> preworimage = [
    "assets/image/banana.jpg",
    "assets/image/shacke.jpg",
    "assets/image/barss.jpg",
    "assets/image/oatameal.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<LoginProvider>(
          builder: (context1,value2,child) {
            return Consumer<AdminProvider>(
                builder: (context1,value,child) {
                  final breackFastList = value.breackFastList;
                  final gainListt = value.gainList;
                  final lossList = value.lossList;
                  return bodyContainer(
                    height,
                    width,
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height / 16.45),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width / 23.45),
                              child: GestureDetector(
                                onTap: () {
                                  callNext(context, BottomNavigationPage());
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
                            SizedBox(width: width / 6.90),
                            appbarText("Admin Food List",width/18.84),
                          ],
                        ),
                        SizedBox(height: height / 50.56),
                        // search funciton..


                        SizedBox(height: height / 45.56),
                        Padding(
                          padding:  EdgeInsets.only(left: width/45.34),
                          child: SizedBox(
                            height: height / 22.90,
                            child: ListView.builder(
                              itemCount: category.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool isSelected = index == selecteIndex;
                                return Padding(
                                  padding: EdgeInsets.only(left: width / 34.56),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        value.getFoodDetails();
                                        selecteIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastOutSlowIn,
                                      height: 40,
                                      width: width / 4.56,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: isSelected
                                              ? [startGradientColor, endGradientColor]
                                              : [Colors.transparent, Colors.transparent],
                                        ),
                                        borderRadius: BorderRadius.circular(23),
                                        border: isSelected
                                            ? null
                                            : Border.all(color: Colors.white.withOpacity(0.26), width: width/999.99),
                                      ),
                                      child: Center(
                                        child: Text(
                                          category[index],
                                          style: TextStyle(
                                            fontFamily: "interlight",
                                            color: isSelected ? Colors.white : Colors.white,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: height/50.56,),
                        Padding(
                          padding: EdgeInsets.only(left: width / 15.45),
                          child: Text('Foods',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "intermedi",
                              color: Colors.white,
                            ),  ),
                        ),
                        if(selecteIndex==0 )
                          breakfastList(
                              ontap:(index){
                                String foodId = breackFastList[index].foodId;
                                value.lodeFoodDetails(foodId);
                                callNext(context, FoodUpdate(
                                  foodImage: breackFastList[index].foodImage,
                                  foodName: breackFastList[index].foodName,
                                  foodCalories: breackFastList[index].foodCalorie,
                                  foodProtein: breackFastList[index].foodProtein,
                                  foodCarbs: breackFastList[index].foodCabs,
                                  foodFat: breackFastList[index].foodFat,
                                  foodId: breackFastList[index].foodId,
                                  foodCategory: breackFastList[index].categoryName,

                                ));
                              },
                              breakfastName: breackFastList.map((food)=>food.foodName).toList(),
                              breakfastImage: breackFastList.map((food)=>food.foodImage).toList(),
                              foodCal: breackFastList.map((food)=>food.foodCalorie).toList(),
                              width: width,
                              height: height

                          )
                        else if(selecteIndex == 1)
                          gainList(
                              ontap:(index){
                                String foodId = gainListt[index].foodId;
                                value.lodeFoodDetails(foodId);
                                callNext(context, FoodUpdate(
                                  foodImage: gainListt[index].foodImage,
                                  foodName: gainListt[index].foodName,
                                  foodCalories: gainListt[index].foodCalorie,
                                  foodProtein: gainListt[index].foodProtein,
                                  foodCarbs: gainListt[index].foodCabs,
                                  foodFat: gainListt[index].foodFat,
                                  foodId: gainListt[index].foodId,
                                  foodCategory: gainListt[index].categoryName,



                                ));
                              },
                              gainName:gainListt.map((food)=>food.foodName).toList(),
                              gainImage:gainListt.map((food)=>food.foodImage).toList(),
                              gainCal: gainListt.map((food)=>food.foodCalorie).toList(),
                              width: width,
                              height: height
                          )
                        else if(selecteIndex == 2)
                            lossListt(
                                ontap:(index){
                                  String foodId = lossList[index].foodId;
                                  value.lodeFoodDetails(foodId);
                                  callNext(context, FoodUpdate(
                                    foodImage: lossList[index].foodImage,
                                    foodName: lossList[index].foodName,
                                    foodCalories: lossList[index].foodCalorie,
                                    foodProtein: lossList[index].foodProtein,
                                    foodCarbs: lossList[index].foodCabs,
                                    foodFat: lossList[index].foodFat,
                                    foodId: lossList[index].foodId,
                                    foodCategory: lossList[index].categoryName,


                                  ),
                                  );
                                },
                                gainName:lossList.map((food)=>food.foodName).toList(),
                                gainImage:lossList.map((food)=>food.foodImage).toList(),
                                gainCal: lossList.map((food)=>food.foodCalorie).toList(),
                                width: width,
                                height: height
                            )
                          else if(selecteIndex == 3)
                              preworkOutListt(
                                  gainName:preFoodName,
                                  preImage:preworimage,
                                  gainCal: prefoodCal,
                                  width: width,
                                  height: height
                              )
                            else if(selecteIndex == 4)
                                preworkOutListt(
                                    gainName:preFoodName,
                                    preImage:preworimage,
                                    gainCal: prefoodCal,
                                    width: width,
                                    height: height
                                )
                      ],
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
