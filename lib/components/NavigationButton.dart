// ignore: file_names
// ignore_for_file: unused_local_variable, use_build_context_synchronously, file_names, duplicate_ignore

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class NavigationButton extends StatelessWidget {
  final String label;
  final String routeName;
  const NavigationButton(
      {super.key, required this.label, required this.routeName});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () async {
            try {
              await audioPlayer
                  .play(AssetSource('sounds/OldKeyboardFoley_02_567.wav'));
              Navigator.pushNamed(context, routeName);
            } catch (e) {
              dev.log('$e');
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Thai',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
