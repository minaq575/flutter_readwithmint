// ignore_for_file: unused_field

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:readwithmint/components/My_input_error_Text.dart';
import 'package:readwithmint/components/my_button.dart';
import 'package:readwithmint/content/Read_mint.dart';
import 'dart:developer' as dev;

import '../components/input_with_error_text.dart';

class SingInScreen extends StatefulWidget {
  static const id = 'sing_in_screen';
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final audioPlayer = AudioPlayer();
  final InputWithErrorText _email = InputWithErrorText();
  final InputWithErrorText _password = InputWithErrorText();
  late String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 150,
                      child: Image.asset('images/Logo.png'),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'ลงชื่อเข้าใช้ด้วยอีเมล์',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Thai',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextInputWithErrorText(
                    input: _email,
                    hintText: 'อีเมล',
                    keyboardType: TextInputType.emailAddress,
                    icon: const Icon(
                      Icons.email,
                      color: Colors.pink,
                    ),
                    label: 'อีเมล*',
                  ),
                  MyTextInputWithErrorText(
                    input: _password,
                    hintText: 'รหัสผ่าน',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    icon: const Icon(
                      Icons.password,
                      color: Colors.pink,
                    ),
                    label: 'รหัสผ่าน*',
                  ),
                  MyButton(
                    label: 'ลงชื่อเข้าใช้',
                    onPressed: () async {
                      // ignore: non_constant_identifier_names
                      final Progress = ProgressHUD.of(context);
                      Progress?.showWithText('Loading..');
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.valueText,
                            password: _password.valueText);
                        if (!mounted) return;
                        Navigator.pushNamed(context, ReadBar.id);
                      } on FirebaseAuthException catch (e) {
                        Progress?.dismiss();
                        if (e.code == "channel-error") {
                          _email.errorText = 'อีเมลผู้ใช้ไม่ถูกต้อง';
                        }
                        if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                          _password.errorText =
                              'รหัสผ่านผิด ${_password.valueText}';
                        } else {
                          dev.log(e.toString());
                        }
                        dev.log(e.toString());
                      }
                      setState(() {});
                      Progress?.dismiss();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
