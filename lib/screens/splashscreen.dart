import 'package:flutter/material.dart';
import 'package:twitterdesigns/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceHeight(context) / 2,
              width: deviceWidth(context),
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.none),
                gradient: RadialGradient(
                  radius: 1.1,
                  tileMode: TileMode.mirror,
                  colors: [
                    Color.fromRGBO(95, 63, 157, 1),
                    Color.fromRGBO(245, 240, 255, 1),
                    Color.fromRGBO(245, 248, 255, 1),
                    // Colors.blue,
                    //  Colors.red,
                  ],
                ),
              ),
              child: Image(
                image: AssetImage('assets/images/home.png'),
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),

            verticalSpace(10),

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
                        CircleImage(imagePath: 'assets/images/computer.jpg'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleImage(imagePath: 'assets/images/pencil.png'),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            verticalSpace(10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Smart Bot Powers \nYour Lessons',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  verticalSpace(10),
                  Text(
                    'Smart bot guides you, personalizing lessons and tracking progress',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
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
