import 'dart:async';
import 'package:app_book/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_book/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceIn),
      ),
    );

    // Wait for 3 seconds and navigate to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(onBoardingScreen.routeName);
    });

    // Start the animation after the widget is fully built
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: "App",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "-",
                            style: TextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [Colors.white, Colors.white, Color(0xFFFE9E3A), Color(0xFFFE9E3A)],
                                  stops: [0.0, 0.5, 0.5, 1.0],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 200.0)),
                            ),
                          ),
                          const TextSpan(
                            text: "Book",
                            style: TextStyle(color: Color(0xFFFE9E3A)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
