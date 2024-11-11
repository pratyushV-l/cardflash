// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        body: Page1(),
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
  // ignore: duplicate_ignore
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
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  int _selectedOption = 0; // 0 means none selected, 1 means first selected, 2 means second selected
  List<Map<String, String>> flashcards = []; // Define flashcards list

  void _selectOption(int option) {
    setState(() {
      _selectedOption = option;
    });
  }

  void _onSubmit() {
    if (_selectedOption == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Page4(flashcards: flashcards), // Pass flashcards to Page4
        ),
      );
    } else if (_selectedOption == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Page5(flashcards: flashcards), // Pass flashcards to Page5
        ),
      );
    }
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Text(
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
                  GestureDetector(
                    onTap: _onSubmit,
                    child: Container(
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

class Page4 extends StatefulWidget {
  final List<Map<String, String>> flashcards;

  const Page4({super.key, required this.flashcards});

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final TextEditingController _textController = TextEditingController();
  bool _isQuestion = true;
  String _question = '';
  String _answer = '';

  void _flip() {
    setState(() {
      if (_isQuestion) {
        _question = _textController.text;
        _textController.clear();
        _textController.text = _answer;
      } else {
        _answer = _textController.text;
        _textController.clear();
        _textController.text = _question;
      }
      _isQuestion = !_isQuestion;
    });
  }

  void _submit() async {
    if (_question.isNotEmpty && _answer.isNotEmpty) {
      setState(() {
        widget.flashcards.add({'question': _question, 'answer': _answer});
        _question = '';
        _answer = '';
        _textController.clear();
        _isQuestion = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> flashcardsList = widget.flashcards.map((flashcard) {
        return '${flashcard['question']}|${flashcard['answer']}';
      }).toList();
      await prefs.setStringList('flashcards', flashcardsList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                    decoration: TextDecoration.none,
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
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        controller: _textController,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontFamily: "ShareTech",
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your text here',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        maxLines: null,
                        expands: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _flip,
                      child: const Text('Flip'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Page3()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Page5 extends StatefulWidget {
  final List<Map<String, String>> flashcards;

  const Page5({super.key, required this.flashcards});

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  int _currentIndex = 0;
  bool _isQuestion = true;

  @override
  void initState() {
    super.initState();
    _loadFlashcards();
  }

  Future<void> _loadFlashcards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? flashcardsList = prefs.getStringList('flashcards');
    if (flashcardsList != null) {
      setState(() {
        widget.flashcards.clear();
        widget.flashcards.addAll(flashcardsList.map((flashcard) {
          List<String> parts = flashcard.split('|');
          return {'question': parts[0], 'answer': parts[1]};
        }).toList());
      });
    }
  }

  void _flip() {
    setState(() {
      _isQuestion = !_isQuestion;
    });
  }

  void _nextFlashcard() {
    setState(() {
      if (widget.flashcards.isNotEmpty) {
        _currentIndex = (_currentIndex + 1) % widget.flashcards.length;
        _isQuestion = true; // Reset to show question first
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  "Review Your Flashcards",
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
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: widget.flashcards.isEmpty
                          ? const Text(
                              'No flashcards available',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 75,
                                fontFamily: "ShareTech",
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Text(
                              _isQuestion ? widget.flashcards[_currentIndex]['question']! : widget.flashcards[_currentIndex]['answer']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 75,
                                fontFamily: "ShareTech",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _flip,
                      child: const Text('Flip'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _nextFlashcard,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Page3()),
              );
            },
          ),
        ),
      ],
    );
  }
}
