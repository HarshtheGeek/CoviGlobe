import 'package:flutter/material.dart';
import 'color_pallete/pallete.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final secondcontainerHeight = screenHeight * 0.9;


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CoviGlobe",
          style: TextStyle(fontFamily: "nexa", fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Pallete.MainContainerColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.33,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Pallete.MainContainerColor,
                    Pallete.blackColor.withOpacity(0.9),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildSymptomText(),
                  const SizedBox(height: 25),
                  _buildHelpText(),
                  const SizedBox(height: 20),
                  _buildButtonRow(),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 1500,
              width: 400,
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Precautions",
                      style: TextStyle(fontFamily: "manrope", fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/background_images/prevention1.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Wash Your Hands",style: TextStyle(fontFamily: "manrope"),)
                        ],
                      ),
                      SizedBox(width: 20),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/background_images/prevention2.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Clean the surface",style: TextStyle(fontFamily: "manrope"),),
                        ],
                      ),
                      SizedBox(width: 20),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/background_images/prevention3.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Wear a Mask",style: TextStyle(fontFamily: "manrope"),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/background_images/prevention3.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Wash Your Hands",style: TextStyle(fontFamily: "manrope"),)
                        ],
                      ),
                      SizedBox(width: 20),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage('https://example.com/your_image.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Clean the surface",style: TextStyle(fontFamily: "manrope"),),
                        ],
                      ),
                      SizedBox(width: 20),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(height: 5,),
                          Text("Wear a Mask",style: TextStyle(fontFamily: "manrope"),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Covid-19",
            style: TextStyle(fontFamily: "nexa", color: Colors.white, fontSize: 30),
          ),
        ),
      ],
    );
  }

  Widget _buildSymptomText() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        "Getting Symptoms?",
        style: TextStyle(fontFamily: "nexa", color: Colors.white, fontSize: 23),
      ),
    );
  }

  Widget _buildHelpText() {
      return const Padding(
        padding: EdgeInsets.only(left: 15.0,right: 50),
        child: Text(
          "If you feel sick with any of the covid 19 symptoms please call or SMS immediately for help.",
          style: TextStyle(fontFamily: "manrope", color: Colors.white, fontSize: 15),
        ),
      );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
      children: [
        _buildCallButton(),
        const SizedBox(width: 20),
        _buildSMSButton(),
      ],
    );
  }

  Widget _buildCallButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          elevation: 5,
        ),
        child: const Row(
          children: [
            Icon(Icons.call,color: Colors.white,),
            SizedBox(width: 5,),
            Text("Call Now",style: TextStyle(fontFamily: "manrope",color: Colors.white),),
          ],
        ),
      ),
    );
  }

  Widget _buildSMSButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          // SMS action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          elevation: 5,
        ),
        child: const Row(
          children: [
            Icon(Icons.sms,color: Colors.white,),
            SizedBox(width: 5,),
            Text("Call Now",style: TextStyle(fontFamily: "manrope",color: Colors.white),),
          ],
        ),
      ),
    );
  }

}
