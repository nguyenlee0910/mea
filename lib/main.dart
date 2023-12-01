import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  // Retain native splash screen until Dart is ready
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (!kIsWeb) {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }

  if (kDebugMode) {
    await FirebasePerformance.instance.setPerformanceCollectionEnabled(false);
  }

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  ErrorWidget.builder = (FlutterErrorDetails error) {
    Zone.current.handleUncaughtError(error.exception, error.stack!);
    return ErrorWidget(error.exception);
  };

  runApp(const MyApp());
  FlutterNativeSplash.remove(); // Now remove splash screen
}
