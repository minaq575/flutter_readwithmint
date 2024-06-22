// ignore_for_file: use_build_context_synchronousl, file_namesy, file_names, use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:readwithmint/content/Home_mint.dart';

import 'package:readwithmint/screen/main_screen.dart';

class ReadBar extends StatefulWidget {
  static const id = 'read_mint';
  const ReadBar({super.key});

  @override
  State<ReadBar> createState() => _ReadBarState();
}

class _ReadBarState extends State<ReadBar> {
  final audioPlayer = AudioPlayer();
  int currentIndex = 0;
  // ignore: non_constant_identifier_names
  List widgetoptions = [
    //กำหนดหน้าให้ว่าจะไปหน้าไหน
    const HomeMint(),
    const Text('คลังเก็บ'),
    const Text('ผู้ใช้'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ReadWithMint',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        leading: const Text(''),
        actions: [
          IconButton(
            onPressed: () async {
              await audioPlayer
                  .play(AssetSource('sounds/OldKeyboardFoley_02_567.wav'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ], //ค้าหา
      ),
      body: Center(
        child: widgetoptions[currentIndex],
        //ไปตามหน้าที่ต้องกร
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.redAccent,
        backgroundColor: Colors.white,
        color: Colors.red,
        animationDuration: const Duration(milliseconds: 300),
        //ber ด้านล่าง
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
