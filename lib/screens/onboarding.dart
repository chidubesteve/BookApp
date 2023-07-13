// ignore_for_file: camel_case_types

import 'package:app_book/screens/home_screen.dart';
import 'package:flutter/material.dart';

class onBoardingScreen extends StatefulWidget {
  static const routeName = '/onboard-screen';

  @override
  State<onBoardingScreen> createState() => _onBoardingScreen();
}

class _onBoardingScreen extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131E32), // Set the background color to #131E32
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/embody_img.jpg',
              height: 400,
            ),
            SizedBox(height: 16),
            Text(
              'Get access to all books\non the go',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'All your favorite books in one place',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the new page here
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFE9E3A),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
