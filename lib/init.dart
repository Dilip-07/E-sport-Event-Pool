import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user/di.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await initDependencyInjection();
  }
}
