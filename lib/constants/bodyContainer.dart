
import 'package:flutter/material.dart';

Widget bodyContainer(double height, double width, Widget child) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0x030B19).withOpacity(1), // Hexadecimal color with full opacity
          Colors.black, // Black color
        ],
        stops: [0.1, 0.5],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child, // Column or any other widget passed as child
  );
}

Widget paymentContainer({
  required String text,
  required String image,
  required double height,
  required double width,
  required double Imagesize,
  required double boxWidth,
  required ontap
}) {
  return Padding(
    padding: EdgeInsets.only(left: width / 18.20),
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        height: height / 10.80,
        width: width / 1.13,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: width / 12.34),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Inter",
              ),
            ),
            SizedBox(width: boxWidth),  // Adjusted using the new parameter
            Image.asset(image, scale: Imagesize),
          ],
        ),
      ),
    ),
  );
}



class PremiumContainer extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;

  PremiumContainer({
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  _PremiumContainerState createState() => _PremiumContainerState();
}

class _PremiumContainerState extends State<PremiumContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Animation speed
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/premium page2.png",),
                  scale: 3.50
            ),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color(0x381896).withOpacity(1), // Adjusted for correct hex format
              ],
              stops: [0.2 + _controller.value * 0.4, 0.5 + _controller.value * 0.4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
