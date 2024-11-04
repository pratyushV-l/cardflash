import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
        ),
        home: Scaffold(
          body: ListView(children: const [
            Page1(),
          ]),
        ),
      );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1920,
          height: 1080,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(1,0),
              radius: 0,
              colors: [Color(0xFF2C2C2C), Color(0xFF252424)]
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 217,
                top: 118,
                child: Container(
                  width: 1486,
                  height: 844,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF5F8C93),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 545,
                top: 416,
                child: Text(
                  "Card Flash",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 220,
                    fontFamily: "Share Tech",
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 802,
                top: 636,
                child: Text(
                  "press to begin...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: "Share Tech",
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 941,
                top: 58,
                child: Text(
                  "1/1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Share Tech",
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ],
          )
        )
      ]
    );
  }
}