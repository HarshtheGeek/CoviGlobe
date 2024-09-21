import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:pox_globe/Splash_and_login/splashscreen.dart';
import 'package:pox_globe/consts.dart';
import 'package:pox_globe/real_time_tracker/world_states.dart';

import 'Homepage.dart';
import 'Newspage.dart';
import 'Prakashchatbot.dart';

void main() {
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

