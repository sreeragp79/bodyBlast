import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/loginProvider.dart';
import 'Bottom Navigation.dart';
import 'LoginPage.dart';
import 'SliderPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _iconAnimationController; // icon animation
  late AnimationController _containerAnimationController; //  red container
  late AnimationController _textFadeInController; // Third controller for text fade-in
  late Animation<double> _iconSizeAnimation;
  late Animation<double> _containerZoomAnimation;
  late Animation<double> _textOpacityAnimation; // for the text

  @override
  void initState() {
    super.initState();
    // Delay 3 seconds to show splash, then check user details
    Future.delayed(Duration(seconds: 3), () {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      loginProvider.checkUserExist(context);
    });
    //  icon animation
    _iconAnimationController = AnimationController(
      duration: const Duration(seconds: 1), // Icon animation duration
      vsync: this,
    );

    //  red container animation
    _containerAnimationController = AnimationController(
      duration: const Duration(seconds: 1), // Container animation duration
      vsync: this,
    );

    //  text fade-in animation
    _textFadeInController = AnimationController(
      duration: const Duration(seconds: 1), // Text fade-in duration
      vsync: this,
    );

    // Icon size animation
    _iconSizeAnimation = Tween<double>(begin: 7000.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Container zoom animation
    _containerZoomAnimation = Tween<double>(begin: 20.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _containerAnimationController,
        curve: Curves.easeOutExpo,
      ),
    );

    // Text fade-in animation (opacity)
    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textFadeInController,
        curve: Curves.easeIn,
      ),
    );

    // Start the animations
    _iconAnimationController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        _containerAnimationController.forward().whenComplete(() {
          _textFadeInController.forward().whenComplete(() {
            // Smooth animation to SliderPage
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1), // Transition duration
                  pageBuilder: (context, animation, secondaryAnimation) => SliderPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Slide in from the right
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            });
          });
        });
      });
    });
    // Delay the permission check by 5 seconds
    Future.delayed(const Duration(seconds: 7), () {
      checkLocationPermission();
    });
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    _containerAnimationController.dispose();
    _textFadeInController.dispose();
    // checkLocationPermission();
    super.dispose();
  }
  Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      // Request location permission
      await Permission.location.request();
      status = await Permission.location.status;
    }

    if (status.isGranted) {
      try {
        // Get current location and save it
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
        );

        // Save location to Firebase
        final provider = Provider.of<LoginProvider>(context, listen: false);
        // await provider.addUserDatasForLocation(context);
      } catch (e) {
        print("Error getting location: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: Listenable.merge([_iconAnimationController, _containerAnimationController, _textFadeInController]),
        builder: (context, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Full screen red container with zoom-out effect
              Center(
                child: Transform.scale(
                  scale: _containerZoomAnimation.value,
                  child: Container(
                    height: 163,
                    width: 163,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x381896).withOpacity(1),
                          Color(0x748ce9).withOpacity(1), // Hexadecimal color with full opacity
                        ],
                        // stops: [0.1, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              // Centered icon with zoom-in effect
              Center(
                child: Transform.scale(
                  scale: _iconSizeAnimation.value / 350,
                  child: Image.asset(
                    "assets/image/appLogo.png", // Replace with your asset image path
                  ),
                ),
              ),

              // FitPro text with fade-in effect
              Padding(
                padding: const EdgeInsets.only(top: 206),
                child: Center(
                  child: Opacity(
                    opacity: _textOpacityAnimation.value,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Fit ",
                            style: TextStyle(
                              fontSize: width/11,
                              color: Colors.white,
                              fontFamily: "intermedi",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "Pro",
                            style: TextStyle(
                              fontSize: width/11,
                              color: Colors.white,
                              fontFamily: "interbold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
