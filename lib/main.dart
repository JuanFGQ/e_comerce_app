import 'package:e_comerce_app/app.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //GetX Local Storage
  await GetStorage.init();
  //todo: Init Payment Methods
  // Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //todo: Initialize Firebase

  //todo: Initialize Authentication

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Load all the new Material Desing  / Themes / Localizations / Bindings

  runApp(const MyApp());
}
