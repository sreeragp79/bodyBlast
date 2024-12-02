import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:body_blast/constants/Navigator.dart';
import 'package:body_blast/constants/bodyContainer.dart';
import 'package:body_blast/user/Bottom%20Navigation.dart';
import 'package:body_blast/user/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SliderPage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  bool animation = false;

  @override
  void initState() {
    super.initState();
   // checkUserLoggedIn();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        animation = true;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(createScaleRoute());
    });
  }
  // void checkUserLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString("SIGN_USER_ID");
  //
  //   if (userId != null) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => BottomNavigationPage()),
  //     );
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => Loginpage()),
  //     );
  //   }
  // }

  // Scale transition route
  Route createScaleRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SliderPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0; // Starting scale
        const end = 1.0;   // Ending scale
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 800),
    );
  }

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
            SizedBox(height: height / 2.61),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: "splash",
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Body Blast'),
                ],
                totalRepeatCount: 1,
              ),
            ),
            SizedBox(height: height / 1.90),
            if (animation)
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: "splash",
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Track Your Activity'),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
