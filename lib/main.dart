import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Page5(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = (0.0);
              const end = (3.0);
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var fadeAnimation = animation.drive(tween);

              return FadeTransition(
                opacity: fadeAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 5),
          )
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color(0xFF403F3F),
              Color(0xFF252524),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "1/2",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "ShareTech",
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 1200,
                height: 600,
                decoration: BoxDecoration(
                  color: const Color(0xFF5F8C93),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF608D94).withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "cardFlash",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 200,
                        fontFamily: "ShareTech",
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "press to begin...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: "ShareTech",
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), _navigatetoPage3);
  }
  void _navigatetoPage3() async {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Page3(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var slideAnimation = animation.drive(tween);

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(seconds: 1),
      ),
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            Color(0xFF403F3F),
            Color(0xFF252524),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "2/2",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "ShareTech",
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 1200,
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xFF5F8C93),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF608D94).withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 1000,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Welcome to the Learning Experience',
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 120,
                            fontFamily: "ShareTech",
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      isRepeatingAnimation: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  int _selectedOption = 0; // 0 means none selected, 1 means first selected, 2 means second selected

  void _selectOption(int option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            Color(0xFF403F3F),
            Color(0xFF252524),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "3/3",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "ShareTech",
                fontWeight: FontWeight.w400,
                height: 0,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 1200,
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xFF5F8C93),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF608D94).withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15), // Adjust the padding as needed
                      child: Text(
                        "Choose an Option",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 105,
                          fontFamily: "ShareTech",
                          fontWeight: FontWeight.w400,
                          height: 0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovering1 = true),
                        onExit: (_) => setState(() => _isHovering1 = false),
                        child: GestureDetector(
                          onTap: () => _selectOption(1),
                          child: Container(
                            width: 500,
                            height: 300,
                            decoration: BoxDecoration(
                              color: const Color(0xFF282827),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedOption == 1
                                      ? const Color.fromARGB(255, 218, 224, 223).withOpacity(0.5)
                                      : _isHovering1
                                          ? const Color.fromARGB(255, 151, 168, 164).withOpacity(0.5)
                                          : const Color.fromARGB(255, 64, 64, 63).withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/create_flashcard.png', // Replace with your image path
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Create a New Flashcard",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: "ShareTech",
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovering2 = true),
                        onExit: (_) => setState(() => _isHovering2 = false),
                        child: GestureDetector(
                          onTap: () => _selectOption(2),
                          child: Container(
                            width: 500,
                            height: 300,
                            decoration: BoxDecoration(
                              color: const Color(0xFF282827),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: _selectedOption == 2
                                      ? const Color.fromARGB(255, 218, 224, 223).withOpacity(0.5)
                                      : _isHovering2
                                          ? const Color.fromARGB(255, 151, 168, 164).withOpacity(0.5)
                                          : const Color.fromARGB(255, 64, 64, 63).withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/review_flashcards.png', // Replace with your image path
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Review Existing Flashcards",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: "ShareTech",
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    height: 100,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF282827),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Begin',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ShareTech',
                          fontSize: 44,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            Color(0xFF403F3F),
            Color(0xFF252524),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create a Flashcard",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "ShareTech",
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 1200,
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xFF5F8C93),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF608D94).withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 0)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );  
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            Color(0xFF403F3F),
            Color(0xFF252524),
          ]
        )
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Review Your Flashcards",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "ShareTech",
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 1200,
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xFF5F8C93),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF608D94).withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 0)
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

