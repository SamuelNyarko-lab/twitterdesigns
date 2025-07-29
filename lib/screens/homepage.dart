import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterdesigns/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = ['All', 'Reading', 'Design', 'Website'];
  int selectedIndex = 0;

  void onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        width: deviceWidth(context),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.none),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.15,
            tileMode: TileMode.clamp,
            colors: [
              Color.fromRGBO(95, 63, 157, 0.7),
              Color.fromRGBO(245, 248, 255, 1),
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(70),
                    SizedBox(
                      height: 60,
                      width: deviceWidth(context),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image(
                              image: AssetImage('assets/images/home.png'),
                              fit: BoxFit.cover,
                              // height: 50,
                              //  width: 50,
                            ),
                          ),
                          horizontalSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Hi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Samuel Nyarko',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(CupertinoIcons.bell),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    Text(
                      'Your Smart AI Language Coach',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),

                    verticalSpace(15),

                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: categories.length,

                        itemBuilder: (context, index) {
                          final isSelected = index == selectedIndex;

                          return GestureDetector(
                            onTap: () => onCategoryTap(index),
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                              constraints: BoxConstraints(
                                // maxWidth: 100,
                                //minWidth: 80,
                              ),
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Color.fromRGBO(151, 117, 223, 1)
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: Text(
                                categories[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
