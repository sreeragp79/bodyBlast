import 'package:body_blast/constants/foodNutrition%20details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/AppBar Texts.dart';
import '../constants/BottonContainer.dart';
import '../constants/Navigator.dart';
import '../constants/Texts.dart';
import '../constants/bodyContainer.dart';
import 'Appointment.dart';
import 'Reviews.dart';

class FoodDetails extends StatelessWidget {
  final foodImage;
  final foodName;
  final foodCalories;
  final foodProtein;
  final foodCarbs;
  final foodFat;
  const FoodDetails({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodCalories,
    required this.foodProtein,
    required this.foodCarbs,
    required this.foodFat,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: bodyContainer(
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
                      image: NetworkImage(foodImage)
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
                    borderRadius: BorderRadius.circular(45)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width/20.45),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/50.56,),
                        Text(
                          foodName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontFamily: "interlight",
                          ),
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "interlight",
                          ),
                        ),
                        SizedBox(height: height/60.56,),
                        Padding(
                          padding:  EdgeInsets.only(left: width/5.90),
                          child: Text(
                            'Data for a serving(512)prepared weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "interlight",
                            ),
                          ),
                        ),
                        SizedBox(height: height/26.56,),
                      Row(
                        children: [
                          buildNutritionCard("Calories", foodCalories),
                          SizedBox(width: width/13.45,),
                          buildNutritionCard("Protein", foodProtein),
                          SizedBox(width: width/13.45,),
                          buildNutritionCard("Carbs", foodCarbs),
                          SizedBox(width: width/13.45,),
                          buildNutritionCard("Fat", foodFat),
                        ],
                      ),

                        SizedBox(height: height/28.56,),
                        Text(
                          "It's surprising how a few herbs can brighten up tuna \n"
                              "salad. Made with reduced-fat mayonnaise, this\n"
                              "version gets its zip from mustard. It a terrific\n"
                              "lightlunch or Sunday brunch dish.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "interlight",
                          ),
                        ),
                        SizedBox(height: height/50.56,),
                        Text(
                          'Recipes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "intermedi",
                          ),
                        ),
                        SizedBox(height: height/90.56,),
                        Text(
                          '2 cans (6 ounces each) light water-packed tuna,\n'
                              '1 cup chopped celery\n'
                              '1/4 cup chopped sweet onion\n'
                              '1/3 cup reduced-fat mayonnaise\n'
                              '2 tablespoons minced fresh parsley\n'
                              '1 tablespoon lemon juice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "interlight",
                          ),
                        ),
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
}
