// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readwithmint/components/My_Text_input.dart';
import 'package:readwithmint/components/my_button.dart';
import 'package:readwithmint/content/Read_mint.dart';
import 'dart:developer' as dev;

class RegistrySceen extends StatefulWidget {
  static const id = 'registry_screen';
  const RegistrySceen({super.key});

  @override
  State<RegistrySceen> createState() => _RegistrySceenState();
}

class _RegistrySceenState extends State<RegistrySceen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: SizedBox(
                height: 150,
                child: Image.asset('images/Logo.png'),
              ),
            ),
            const Center(
              child: Text(
                'ลงทะเบียน',
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
            MyTextInput(
              hintText: 'ชื่อ',
              keyboardType: TextInputType.text,
              onChanged: (value) {
                username = value;
              },
              icon: const Icon(
                Icons.verified_user,
                color: Colors.pinkAccent,
                size: 20,
              ),
              label: 'ชื่อ*',
            ),
            MyTextInput(
              hintText: 'อีเมล',
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              icon: const Icon(
                Icons.email,
                color: Colors.pinkAccent,
                size: 20,
              ),
              label: 'อีเมล*',
            ),
            MyTextInput(
              hintText: 'รหัสผ่าน',
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                password = value;
              },
              icon: const Icon(
                Icons.password,
                color: Colors.pinkAccent,
                size: 20,
              ),
              label: 'รหัสผ่าน*',
            ),
            MyButton(
              label: 'ลงทะเบียน',
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  if (userCredential.user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, ReadBar.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == "weak-password") {
                    dev.log('The password provided is too weak');
                  } else if (e.code == 'email-already-in-use') {
                    dev.log('The account already exists for that email');
                  } else {
                    dev.log(e.toString());
                  }
                } catch (e) {
                  dev.log(e.toString());
                }
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
