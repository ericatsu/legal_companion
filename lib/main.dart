// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_companion/controller/constitution_controller.dart';
import 'package:legal_companion/screens/onboard.dart';
import 'package:legal_companion/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ConstitutionController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //print("Error");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Splash();
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

