import 'package:flutter/material.dart';
import 'package:pox_globe/color_pallete/pallete.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Section",style: TextStyle(fontFamily: 'nexa',color: Colors.white,fontSize: 35),),
        backgroundColor: Pallete.MainContainerColor,
      ),
    );
  }
}
