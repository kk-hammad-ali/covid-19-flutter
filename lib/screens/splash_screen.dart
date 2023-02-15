import 'dart:async';
import 'dart:math';

import 'package:covid_19/screens/worlds_stat.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WorldStatScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image.asset("images/virus.png"),
                ),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animationController.value * 2.0 * pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTrackerApp',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
