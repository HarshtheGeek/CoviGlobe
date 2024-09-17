import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pox_globe/color_pallete/pallete.dart';

class WorldState extends StatefulWidget {
  const WorldState({super.key});

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[

  const Color(0xff4285F4),
  const Color(0xff34A853),
  const Color (0xffEA4335),

  ];


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final containerHeight = screenHeight * 0.3;
    final containerWidth = screenWidth * 0.9;

    final secondContainerHeight = screenHeight * 0.8;
    final secondContainerWidth = screenWidth * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PoxGlobe",
          style: TextStyle(
            fontFamily: "nexa",
            color: Pallete.whiteColor,
            fontSize: 35,
          ),
        ),
        backgroundColor: Pallete.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_images/Worldstatepage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Second container just below the app bar
            Container(
              height: containerHeight,
              width: containerWidth,
              margin: const EdgeInsets.all(10), // Add margin for spacing
              decoration: BoxDecoration(
                  color: Pallete.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(4, 5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]),
              child: const PieChart(
                dataMap: {
                  "Total": 200,
                  "Recovered": 200,
                  "Death": 30,
                },
                animationDuration: Duration(milliseconds: 2000),
                colorList: Color[],
              ),
            ),
            const SizedBox(height: 15), // Add spacing between the containers
            Expanded(
              child: Center(
                child: Container(
                  height: secondContainerHeight,
                  width: secondContainerWidth,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(4, 5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
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
