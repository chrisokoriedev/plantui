import 'dart:ui';

import 'package:flutter/material.dart';

const whiteColor = Colors.white;
const lightGreen = Color(0xff7f8f6b);
const textColor = Color(0xffb8c5a5);
const darkGreenColor = Color(0xff2c4005);
const darkBgColor = Color(0xff1e2223);
const bottomSheetColor = Color(0xff33362b);
final regularBorderRadius = BorderRadius.circular(10);
buttonAuth(double mediaWidth, VoidCallback press, String title, Color kColor) {
  return InkWell(
    onTap: press,
    child: Container(
      width: mediaWidth * 0.5 + 30,
      height: 50,
      decoration:
          BoxDecoration(color: kColor, borderRadius: regularBorderRadius),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      )),
    ),
  );
}

sizedHeight(double height) => SizedBox(
      height: height,
    );
sizedWidth(double width) => SizedBox(
      width: width,
    );
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: mediaWidth,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            colorFilter: ColorFilter.mode(
                const Color(0xff11240e).withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's Make a \nGreen Life",
                  style: TextStyle(
                    fontSize: 40,
                    color: whiteColor,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Divider(
                  color: whiteColor,
                  endIndent: 100,
                  height: 20,
                  thickness: 2,
                ),
                sizedHeight(40),
                buttonAuth(mediaWidth, () {}, 'Log In', lightGreen),
                sizedHeight(20),
                buttonAuth(mediaWidth, () {}, 'Sign up', darkGreenColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsPage())),
                  child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: darkBgColor,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));
  @override
  void initState() {
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaHeight * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedHeight(190),
                        const Text(
                          "Papaya",
                          style: TextStyle(
                            fontSize: 40,
                            color: whiteColor,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          color: whiteColor,
                        ),
                        sizedHeight(10),
                        const Text(
                          "fruit plants, help you make\na healthy life",
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    ScaleTransition(
                      scale: animationController,
                      child: Container(
                        width: mediaWidth * 0.3 + 30,
                        height: 500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/plant.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Size:',
                style: TextStyle(fontSize: 25, color: whiteColor),
              ),
              sizedHeight(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: getData
                      .map((e) => Container(
                            width: mediaWidth * 0.2 + 20,
                            margin: const EdgeInsets.only(right: 20),
                            height: 150,
                            decoration: BoxDecoration(
                              color: e.color,
                              borderRadius: regularBorderRadius,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.title.toString(),
                                  style: const TextStyle(
                                      color: whiteColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  ' 0',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFeatures: [FontFeature.superscripts()],
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: bottomSheetColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Add to Card',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: whiteColor)),
            const Text('\$5000',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: whiteColor)),
            Row(
              children: const [
                Icon(
                  Icons.double_arrow,
                  color: whiteColor,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SizedClass {
  final int title;
  final Color color;

  SizedClass(this.title, this.color);
}

List<SizedClass> getData = [
  SizedClass(20, lightGreen),
  SizedClass(25, darkGreenColor),
  SizedClass(30, bottomSheetColor),
  SizedClass(35, lightGreen),
];
