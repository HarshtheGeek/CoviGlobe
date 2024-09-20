import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pox_globe/color_pallete/pallete.dart';
import 'package:pox_globe/models/WorldStatsModel.dart';

import '../services/Stats_services.dart';

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
    const Color(0xffEA4335),
  ];

  @override
  Widget build(BuildContext context) {
    StatServices statServices = StatServices();

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
          "CoviGlobe",
          style: TextStyle(
            fontFamily: "nexa",
            color: Pallete.whiteColor,
            fontSize: 35,
          ),
        ),
        backgroundColor: Pallete.Purple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_images/Mainscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            FutureBuilder(
                future: statServices.FetchWorldStats(),
                builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCube(
                          color: Colors.white,
                          size: 30,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        Container(
                          height: containerHeight,
                          width: containerWidth,
                          margin: const EdgeInsets.all(
                              10), // Add margin for spacing
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
                              "Total": 4000,
                              "Recovered": 1300,
                              "Deaths": 70,
                            },
                            animationDuration: Duration(milliseconds: 2000),

                          ),
                        ),
                      ],
                    );
                  }
                }),
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
