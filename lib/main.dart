import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:readwithmint/firebase_options.dart';
import 'package:readwithmint/screen/main_screen.dart';
import 'package:readwithmint/content/Read_mint.dart';
import 'package:readwithmint/screen/registry_screen.dart';
import 'package:readwithmint/screen/sing_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => const MainScreen(),
        ReadBar.id: (context) => const ReadBar(),
        RegistrySceen.id: (context) => const RegistrySceen(),
        SingInScreen.id: (context) => const SingInScreen(),
      },
    );
  }
}
