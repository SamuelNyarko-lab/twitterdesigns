import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterdesigns/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

                    verticalSpace(30),

                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ActionCard(
                          imagePath: 'assets/images/book.png',
                          actionTitle: 'Reading',
                          percentageComplete: '50',
                          onActionTap: () {},
                        ),
                        ActionCard(
                          imagePath: 'assets/images/earphone.png',
                          actionTitle: 'Listening',
                          percentageComplete: '40',
                          onActionTap: () {},
                        ),
                        ActionCard(
                          imagePath: 'assets/images/microphone.png',
                          actionTitle: 'Speaking',
                          percentageComplete: '70',
                          onActionTap: () {},
                        ),
                        ActionCard(
                          imagePath: 'assets/images/message.png',
                          actionTitle: 'Conversation',
                          percentageComplete: '80',
                          onActionTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CircleImage extends StatelessWidget {
  final String imagePath;
  const CircleImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(246, 246, 245, 1),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
          //color: Colors.transparent,
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.imagePath,
    required this.actionTitle,
    required this.percentageComplete,
    required this.onActionTap,
  });
  final String imagePath, actionTitle, percentageComplete;
  final Function onActionTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (deviceWidth(context) / 2) - 30,
      height: (deviceWidth(context) / 2) - 30,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleImage(imagePath: imagePath),
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(246, 246, 245, 1),
                    ),
                  ),
                  child: Icon(Icons.north_east, size: 18),
                ),
              ],
            ),
          ),

          Spacer(),

          Text(
            actionTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          verticalSpace(3),
          Text(
            '$percentageComplete% completed',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.calendar,
    CupertinoIcons.chat_bubble_text,
    CupertinoIcons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 260,
      height: 70,
      constraints: BoxConstraints(
        maxWidth: deviceWidth(context) / 1.4,
        //minWidth: 80,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? Color(0xFF9C6BFF)
                        : Color.fromRGBO(246, 246, 245, 1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.black87,
                size: 24,
              ),
            ),
          );
        }),
      ),
    );
  }
}
