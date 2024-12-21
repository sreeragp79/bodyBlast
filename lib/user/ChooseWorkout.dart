import 'package:body_blast/Provider/adminProvider.dart';
import 'package:body_blast/constants/AppBar%20Texts.dart';
import 'package:body_blast/constants/Loading.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'WorkOut Vedio.dart';

class ChooseWorkout extends StatefulWidget {
  ChooseWorkout({super.key});

  @override
  State<ChooseWorkout> createState() => _ChooseWorkoutState();
}

class _ChooseWorkoutState extends State<ChooseWorkout> {
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final workoutItems =
        Provider.of<AdminProvider>(context).workOutList; // acess the class
    return PopScope(
    canPop: false,
      onPopInvoked: (val) {
        showExitDialog();
      },
      child: Consumer<AdminProvider>(builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: bodyContainer(
                height,
                width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height/16.45,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width/23.45),
                          child: GestureDetector(
                            onTap: () {
                              callNext(context, BottomNavigationPage());
                            },
                            child: Container(
                              width: width/7.45,
                              height: height/20.45,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.20),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/image/Backarow.png"),scale: 4.20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: width/5.34,),
                        appbarText("WorkOuts",width/14.84),
                        Container(
                          width: width/7.10,
                          height: height/20.45,
                        ),  // invisible container for balance
                      ],
                    ),
                    SizedBox(height: height / 40),
                    Expanded(
                      child: SizedBox(
                        height: height / 1.2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 28),
                          child: ListView.builder(
                            shrinkWrap: true,
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
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Left container
                                  GestureDetector(
                                    onTap: () {
                                      callNext(
                                        context,
                                        WorkOutVedio(
                                          videoPath: videoPaths[rowIndex * 2],
                                          workoutName: workoutItems[rowIndex * 2]
                                              .workOutName,
                                          workoutImage: workoutItems[rowIndex * 2]
                                              .workOutImage,
                                          mins: workoutItems[rowIndex * 2]
                                              .workOutMins,
                                          cals:
                                              workoutItems[rowIndex * 2].workOutCal,
                                          sets: workoutItems[rowIndex * 2]
                                              .workOutSets,
                                        ),
                                      );
                                    },
                                    child: Container(
                                        height: height / 3.40,
                                        width: width / 2.30,
                                        margin: EdgeInsets.only(
                                            bottom: height / 80.34,
                                            right: width / 23),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(25),
                                            child: Stack(children: [
                                              Image.network(
                                                workoutItems[rowIndex * 2]
                                                    .workOutImage,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                    child: loader(),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width / 38.34),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Spacer(),
                                                    TrainersName(
                                                        leftWorkout.workOutName,width/15),
                                                    Text(
                                                      "${leftWorkout.workOutSets} sets / ${leftWorkout.workOutMins} min",
                                                      style: TextStyle(
                                                        fontSize: width/34.25,
                                                        color: Colors.grey,
                                                        fontFamily: "interlight",
                                                      ),
                                                    ),
                                                    SizedBox(height: height / 60),
                                                  ],
                                                ),
                                              ),
                                            ]
                                            ),
                                        )
                                    ),
                                  ),
                                  // Right container (if available)
                                  if (rowIndex * 2 + 1 < workoutItems.length)
                                    GestureDetector(
                                      onTap: () {
                                        callNext(
                                            context,
                                            WorkOutVedio(
                                              videoPath:
                                                  videoPaths[rowIndex * 2 + 1],
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
                                            ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: height / 999.34),
                                        height: height / 4.30,
                                        width: width / 2.40,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.circular(25),
                                         child: Stack(
                                           children: [
                                             Image.network(
                                               workoutItems[rowIndex * 2 + 1]
                                                   .workOutImage,
                                               fit: BoxFit.cover,
                                               loadingBuilder: (context, child,
                                                   loadingProgress) {
                                                 if (loadingProgress == null)
                                                   return child;
                                                 return Center(
                                                   child: loader(),
                                                 );
                                               },
                                             ),
                                             Padding(
                                               padding:
                                               EdgeInsets.only(left: width / 38.34),
                                               child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Spacer(),
                                                   TrainersName(
                                                       rightWorkout!.workOutName,width/15),
                                                   Text(
                                                     "${rightWorkout.workOutSets} sets / ${rightWorkout.workOutMins} min",
                                                     style: TextStyle(
                                                       fontSize: width/34.25,
                                                       color: Colors.grey,
                                                       fontFamily: "interlight",
                                                     ),
                                                   ),
                                                   SizedBox(height: height / 60),
                                                 ],
                                               ),
                                             ),
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
                      ),
                    )
                  ],
                )),
          ),
        );
      }),
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
