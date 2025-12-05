import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() {
        _opacityLevel = 1.0;
      });
    });

    // Navigate safely to onboarding
    Timer(const Duration(milliseconds: 3500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color deepBlue = Theme.of(context).primaryColorDark;

    return Scaffold(
      backgroundColor: deepBlue,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacityLevel,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.school,
                color: Colors.white,
                size: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                'UniGuide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 100),
              const Text(
                'Find Your University, Shape Your Destiny',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
