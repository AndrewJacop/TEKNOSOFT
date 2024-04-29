import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/app.dart';
import 'package:flutter_t_store/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
// Todo: Add Widgets Binding
// Todo: Init Local Storage
// Todo: Init Payment Methods
// Todo: Await Native Splash

// Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

// Todo: Initialize Authentication

// Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
