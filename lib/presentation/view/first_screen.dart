import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/presentation/view/home_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedSplashScreen(
            splash: Icons.description,
            splashIconSize: 100,
            nextScreen: const HomeView(),
            splashTransition: SplashTransition.rotationTransition,
            backgroundColor: const Color(0xffFFCC80)),
        const Positioned(
          bottom: 150,
          child: Text(
            'Notes App',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
