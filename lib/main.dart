import 'dart:io';
import 'package:firebase/Screens/homepage.dart';
import 'package:firebase/Screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
  ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBBSGyl7OS_bPgMEqjeTEr460xtlZuIry8",
      appId: "1:449871622996:android:74eff748b3741aa7248ec1",
      messagingSenderId: "449871622996",
      projectId: "fir-f4215",
    ),
  )
  : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      // home: const HomePage(),
    );
  }
}

