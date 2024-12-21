import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/admin/WorkOut%20Update.dart';
import 'package:body_blast/constants/AppBar%20Texts.dart';
import 'package:body_blast/constants/Loading.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user/WorkOut Vedio.dart';

class WorkOutList extends StatefulWidget {
  WorkOutList({super.key});

  @override
  State<WorkOutList> createState() => _WorkOutListState();
}

class _WorkOutListState extends State<WorkOutList> {
  final List<String> videoPaths = [
    "assets/video/blattlerope.mp4",
    "assets/video/squarting.mp4",
    "assets/video/pullUp.mp4",
    "assets/video/mountain.mp4",
    "assets/video/biceps.mp4",
    "assets/video/shoulder.mp4",
    "assets/video/triceps.mp4",
    "assets/video/abs.mp4",
    "assets/video/forarm.mp4",
    "assets/video/leg.mp4",
    "assets/video/back.mp4",
    "assets/video/back.mp4",
  ];
  Map<int, bool> isLoading = {};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final workoutItems =
        Provider.of<AdminProvider>(context).workOutList; // acess the class

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: bodyContainer(
            height,
            width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 16.34,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20.34),
                  child: Text(
                    "CHOOSE\n"
                    "WORKOUT",
                    style: TextStyle(
                        fontSize: 32,
                        height: height / 800.99,
                        color: Colors.white,
                        fontFamily: "interbold"),
                  ),
                ),
                SizedBox(height: height / 40),
                SizedBox(
                  height: height / 1.2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 28),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemCount: (workoutItems.length / 2)
                          .ceil(), // row count ആയി മാറ്റുന്നു
                      itemBuilder: (context, rowIndex) {
                        final leftWorkout = workoutItems[rowIndex * 2];
                        final rightWorkout =
                            (rowIndex * 2 + 1 < workoutItems.length)
                                ? workoutItems[rowIndex * 2 + 1]
                                : null;
                        // Initialize loading state for new rows
                        if (!isLoading.containsKey(rowIndex)) {
                          isLoading[rowIndex] = true;
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isLoading[rowIndex] =
                                  false; // Set loading to false after 2 seconds
                            });
                          });
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left container
                            GestureDetector(
                              onTap: () {
                                callNext(
                                  context,
                                  WorkOutUpdate(
                                    workoutName:
                                        workoutItems[rowIndex * 2].workOutName,
                                    workoutImage:
                                        workoutItems[rowIndex * 2].workOutImage,
                                    mins:
                                        workoutItems[rowIndex * 2].workOutMins,
                                    cals: workoutItems[rowIndex * 2].workOutCal,
                                    sets:
                                        workoutItems[rowIndex * 2].workOutSets,
                                    workOutId:
                                        workoutItems[rowIndex * 2].workOutIdd,
                                  ),
                                );
                              },
                              child: Container(
                                height: height / 3.40,
                                width: width / 2.30,
                                margin: EdgeInsets.only(
                                    bottom: height / 80.34, right: width / 23),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        workoutItems[rowIndex * 2]
                                            .workOutImage),
                                  ),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: width / 38.34),
                                  child: isLoading[rowIndex] == true
                                      ? Center(
                                          child: loader(),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: height / 4.99,
                                            ),
                                            TrainersName(
                                                leftWorkout.workOutName,width/19),
                                            Text(
                                              "${leftWorkout.workOutSets} sets / ${leftWorkout.workOutMins} min",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontFamily: "interlight",
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            // Right container (if available)
                            if (rowIndex * 2 + 1 < workoutItems.length)
                              GestureDetector(
                                onTap: () {
                                  callNext(
                                      context,
                                      WorkOutUpdate(
                                        workoutName:
                                            workoutItems[rowIndex * 2 + 1]
                                                .workOutName,
                                        workoutImage:
                                            workoutItems[rowIndex * 2 + 1]
                                                .workOutImage,
                                        mins: workoutItems[rowIndex * 2 + 1]
                                            .workOutMins,
                                        cals: workoutItems[rowIndex * 2 + 1]
                                            .workOutCal,
                                        sets: workoutItems[rowIndex * 2 + 1]
                                            .workOutSets,
                                        workOutId:
                                            workoutItems[rowIndex * 2 + 1]
                                                .workOutIdd,
                                      ));
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: height / 999.34),
                                  height: height / 4.30,
                                  width: width / 2.40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          workoutItems[rowIndex * 2 + 1]
                                              .workOutImage),
                                    ),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: width / 38.34),
                                    child: isLoading[rowIndex] == true
                                        ? Center(
                                            child: loader(),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: height / 7.10,
                                              ),
                                              TrainersName(
                                                  rightWorkout!.workOutName,width/19),
                                              Text(
                                                "${rightWorkout.workOutSets} sets / ${rightWorkout.workOutMins} min",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontFamily: "interlight",
                                                ),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
