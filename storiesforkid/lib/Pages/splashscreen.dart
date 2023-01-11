import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.withOpacity(0.8),
            Colors.purple.withOpacity(0.8),
            Colors.blue.withOpacity(0.8),
            Colors.green.withOpacity(0.8),
            Colors.yellow.withOpacity(0.8),
            Colors.orange.withOpacity(0.8),
            Colors.red.withOpacity(0.8),
          ],
        ),
      ),
      child: Center(
          child:
              // Load a Lottie file from a remote url
              Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_rzp5gdfi.json')),
    );
  }
}
