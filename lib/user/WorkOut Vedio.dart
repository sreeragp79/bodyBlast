import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:body_blast/Provider/userProvider.dart';
import '../constants/AppBar Texts.dart';
import '../constants/Texts.dart';
import '../constants/bodyContainer.dart';

class WorkOutVedio extends StatefulWidget {
  final String videoPath;
  final String workoutName;
  final String workoutImage;
  final String mins;
  final String cals;
  final String sets;
   WorkOutVedio({
  super.key,
  required this.videoPath,
  required this.workoutName,
  required this.workoutImage,
  required this.mins,
  required this.cals,
  required this.sets,
   });

  @override
  State<WorkOutVedio> createState() => _WorkOutVideoState();
}

class _WorkOutVideoState extends State<WorkOutVedio> {
  late CustomVideoPlayerController customVideoPlayerController;
  bool isVideoPlaying = false;
  bool isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  void initializeVideoPlayer() {
    VideoPlayerController videoPlayerController = VideoPlayerController.asset(
      widget.videoPath,
    );

    customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );

    videoPlayerController.initialize().then((value) {
      setState(() {
        isVideoInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

  void playVideo() {
    if (isVideoInitialized) {
      setState(() {
        isVideoPlaying = true;
      });
      customVideoPlayerController.videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<Userprovider>(
          builder: (context1, value1, child) {
            return SingleChildScrollView(
              child: bodyContainer(
                height,
                width,
                Column(
                  children: [
                    Container(
                      width: width,
                      height: height / 2.50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: !isVideoPlaying
                            ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.workoutImage),
                        )
                            : null,
                      ),
                      child: Center(
                        child: !isVideoPlaying
                            ? GestureDetector(
                          onTap: playVideo,
                          child: Image.asset(
                            "assets/image/payBotton.png",
                            scale: 4,
                          ),
                        )
                            : CustomVideoPlayer(
                          customVideoPlayerController: customVideoPlayerController,
                        ),
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
                                      TrainersName(widget.workoutName,width/16),
                                      SizedBox(width: width/2.10,),
                                      GestureDetector(
                                          onTap: () => value1.makePhoneCall(context, '+917994152461'),
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
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: width/45.56),
                                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            buildStatColumn("${widget.mins}","min"),
                                            Container(
                                              width: width/999.999,
                                              height: height/16.45,
                                              color: Colors.grey[600],
                                            ),
                                            buildStatColumn('${widget.cals}', 'Cal'),
                                            Container(
                                              width: width/999.999,
                                              height: height/16.45,
                                              color: Colors.grey[600],
                                            ),
                                            buildStatColumn('${widget.sets}', ' Sets '),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height/50.56,),
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "intermedi",
                                    ),
                                  ),
                                  SizedBox(height: height/90.56,),
                                  Text(
                                    'You can use ropes at the beginning of session as ,'
                                        'part of a warm-up or activation phase. You can '
                                        'also use them in the middle of your workoutto '
                                        'intensity with waves, slams, and whips'
                                        'or you can use them at the end of a workoutor'
                                        'as a finisher for time orreps. Also, they are'
                                        'good to pump your muscles at the end'
                                        'of eachmuscle group training.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width/23.22,
                                      fontFamily: "interlight",
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ]
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

