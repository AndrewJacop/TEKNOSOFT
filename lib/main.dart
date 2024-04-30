import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_t_store/app.dart';
import 'package:flutter_t_store/data/repositories/authentication_repository.dart';
import 'package:flutter_t_store/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
// Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

// Init Local Storage
  await GetStorage.init();

// Todo: Init Payment Methods
// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

// Todo: Initialize Authentication

// Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
