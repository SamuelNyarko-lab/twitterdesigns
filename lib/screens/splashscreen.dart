import 'package:flutter/material.dart';
import 'package:twitterdesigns/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        width: deviceWidth(context),
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.none),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.4,
            colors: [
              Color.fromRGBO(95, 63, 157, 0.7),
              Color.fromRGBO(245, 248, 255, 1),
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight(context) / 2,
                    width: deviceWidth(context),
                    child: Image(
                      image: AssetImage('assets/images/home.png'),
                      fit: BoxFit.contain,
                    ),
                  ),

                  verticalSpace(15),

                  SizedBox(
                    height: 100,
                    width: deviceWidth(context) - 100,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleImage(imagePath: 'assets/images/books.png'),
                              Spacer(),
                            ],
                          ),
                          Column(
                            children: [
                              Spacer(),
                              CircleImage(
                                imagePath: 'assets/images/computer.jpg',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleImage(
                                imagePath: 'assets/images/pencil.png',
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  verticalSpace(15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'Smart Bot Powers \nYour Lessons',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        verticalSpace(10),
                        Text(
                          'Smart bot guides you, personalizing lessons and tracking progress',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  verticalSpace(30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            height: 70,
                            // minWidth: deviceWidth(context) / 1.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.white,
                            child: Text(
                              'Start Learning',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        Container(
                          height: 70,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 0.3, color: Colors.grey),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            shape: CircleBorder(),
                            color: Color.fromRGBO(151, 117, 223, 1),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  final String imagePath;
  const CircleImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
