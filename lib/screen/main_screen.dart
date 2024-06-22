// ignore_for_file: override_on_non_overriding_member
// import 'dart:developer' as dev;
// import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:readwithmint/screen/registry_screen.dart';
import 'package:readwithmint/screen/sing_in_screen.dart';
import '../components/NavigationButton.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: Image.asset('images/Logo.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('READ WITH MINT',
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontFamily: "Thai",
                        fontWeight: FontWeight.bold))
              ],
              repeatForever: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const NavigationButton(
            label: "ลงชื่อเข้าใช้ด้วยอีเมล์",
            routeName: SingInScreen.id,
          ),
          const NavigationButton(
            label: "ลงทะเบียน",
            routeName: RegistrySceen.id,
          ),
        ],
      ),
    );
  }
}
