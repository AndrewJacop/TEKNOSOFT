import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_t_store/app.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// --- Entry Point of Flutter App
Future<void> main() async {
// Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

// GetX Local Storage
  await GetStorage.init();

// Todo: Init Payment Methods
// Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

// Todo: Initialize Authentication

// Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
