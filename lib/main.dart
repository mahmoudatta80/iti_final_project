import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/core/routing/app_router.dart';
import 'package:iti_final_project/core/utils/dependency_injection.dart';
import 'package:iti_final_project/core/utils/shared_preferences.dart';
import 'package:iti_final_project/eco_trade_app.dart';
import 'package:iti_final_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(EcoTradeApp(appRouter: AppRouter()));
}
