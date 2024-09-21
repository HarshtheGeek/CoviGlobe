import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pox_globe/Homepage.dart';

import '../color_pallete/pallete.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate after 5 seconds
    Timer(const Duration(seconds: 5), () {
      // Navigate to Homepage after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_images/SplashScreenBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CoviGlobe',
                    style: TextStyle(
                      fontFamily: 'nexa',
                      color: Pallete.whiteColor,
                      fontSize: 65,
                    ),
                  ),
                  Text(
                    "Developed by Harsh.V",
                    style: TextStyle(
                      fontFamily: "manrope",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SpinKitFadingFour(
                  color: Pallete.whiteColor,
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
