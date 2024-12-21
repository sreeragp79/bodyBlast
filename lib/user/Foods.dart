import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/Provider/loginProvider.dart';
import 'package:body_blast/constants/Food%20List.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/constants/colors.dart';
import 'package:body_blast/models/class.dart';
import 'package:body_blast/user/FoddDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/AppBar Texts.dart';
import '../constants/Navigator.dart';
import 'Bottom Navigation.dart';

class Foods extends StatefulWidget {
  Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
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

    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showExitDialog();
      },
      child: Scaffold(
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
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                          appbarText("Foods",width/14.84),
                          Container(
                            width: width/5.10,
                            height: height/20.45,
                          ),
                        ],
                      ),
                      SizedBox(height: height / 50.56),
                      // search funciton..

                      Autocomplete<FoodModel>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<FoodModel>.empty();
                          }
                          // Store 3 list datas in one list
                          List<FoodModel> allList = [
                            ...breackFastList,
                            ...gainListt,
                            ...lossList,
                          ];
                          return allList.where((foods) =>
                              foods.foodName.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()));
                        },
                        fieldViewBuilder: (context, fieldController, focusNode, onFieldSubmitted) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            fieldController.text = value2.searchController.text;
                          });
                          return Padding(
                            padding: EdgeInsets.only(left: width / 21.45),
                            child: Container(
                              width: width / 1.11,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.45),
                                  width: width / 999.99,
                                ),
                              ),
                              child: TextField(
                                controller: fieldController,
                                focusNode: focusNode,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "interlight",
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...',
                                  contentPadding: EdgeInsets.symmetric(horizontal: width / 13.56),
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.80),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onSelected: (FoodModel food) {
                         callNext(context, FoodDetails(
                             foodImage: food.foodImage,
                             foodName: food.foodName,
                             foodCalories: food.foodCalorie,
                             foodProtein: food.foodProtein,
                             foodCarbs: food.foodCabs,
                             foodFat: food.foodCabs,
                         ));
                        },
                        optionsViewBuilder: (context, onSelected, options) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Material(
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.zero,
                                width: width/1.2,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: ListView.builder(padding: EdgeInsets.zero,
                                  itemCount: options.length,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    List<FoodModel> optionsList = options.toList();
                                    return SizedBox(
                                      height: 50,
                                      child: ListTile(
                                        // contentPadding: EdgeInsets.symmetric(vertical: 0),
                                        title: Text(optionsList[index].foodName,
                                          style: TextStyle(
                                              color: Colors.blue.withOpacity(1)
                                          ),
                                        ),
                                        onTap: (){
                                          onSelected(optionsList[index]);
                                        },
                                        trailing: SizedBox(
                                          child: Image.network(optionsList[index].foodImage,
                                          width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),

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
                    callNext(context, FoodDetails(
                      foodImage: breackFastList[index].foodImage,
                      foodName: breackFastList[index].foodName,
                      foodCalories: breackFastList[index].foodCalorie,
                      foodProtein: breackFastList[index].foodProtein,
                      foodCarbs: breackFastList[index].foodCabs,
                      foodFat: breackFastList[index].foodFat,

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
                              callNext(context, FoodDetails(
                                foodImage: gainListt[index].foodImage,
                                foodName: gainListt[index].foodName,
                                foodCalories: gainListt[index].foodCalorie,
                                foodProtein: gainListt[index].foodProtein,
                                foodCarbs: gainListt[index].foodCabs,
                                foodFat: gainListt[index].foodFat,

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
                              callNext(context, FoodDetails(
                                foodImage: lossList[index].foodImage,
                                foodName: lossList[index].foodName,
                                foodCalories: lossList[index].foodCalorie,
                                foodProtein: lossList[index].foodProtein,
                                foodCarbs: lossList[index].foodCabs,
                                foodFat: lossList[index].foodFat,

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
      ),
    );
  }

  Future<bool> showExitDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0x111111).withOpacity(1),
        title: Text(
          'Exit app?',
          style: TextStyle(
              fontFamily: "jeju2",
              fontSize: 20,
              color: Colors.white
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Are you sure you want to exit the app?',
            style: TextStyle(
                fontFamily: "jeju2",
                fontSize: 16,
                color: Colors.white
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: "jeju2",
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              SystemNavigator.pop();
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
                fontFamily: "jeju2",
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ) ?? false;
  }

}
