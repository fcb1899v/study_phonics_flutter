/// Study Phonics App - Main Entry Point
/// 
/// Interactive phonics learning app with Firebase Analytics, AdMob integration,
/// and Text-to-Speech functionality. Supports iOS and Android platforms.

import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_phonics/constant.dart';
import 'firebase_options.dart';
import 'listpage.dart';

/// Main entry point of the application
/// Initializes Flutter, Firebase, AdMob, and starts the app
Future<void> main() async {
  // Ensure Flutter is initialized before platform-specific code
  WidgetsFlutterBinding.ensureInitialized();
  // Lock device orientation to portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Load environment variables from .env file
  await dotenv.load(fileName: "assets/.env");
  // Initialize Firebase with platform-specific options
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      name: "Study Phonics",
      options: DefaultFirebaseOptions.currentPlatform,
    );
    MobileAds.instance.initialize();
  }
  // Start the app with Riverpod provider scope
  runApp(const ProviderScope(child: MyApp()));
}

/// Root widget of the application
/// Configures MaterialApp with theme, navigation observers, and platform features
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myTitle,
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: myFont // Use custom font family
      ),
      home: ListPage(), // Start with the list page
      navigatorObservers: <NavigatorObserver>[
        // Firebase Analytics observer for tracking page views (Android only)
        if (Platform.isAndroid) FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        // Route observer for additional navigation tracking
        if (Platform.isAndroid) RouteObserver<ModalRoute>()
      ],
    );
  }
}

/// Initialize App Tracking Transparency (ATT) plugin
/// Requests tracking authorization on iOS/macOS platforms for personalized ads
Future<void> initATTPlugin() async {
  if (Platform.isIOS || Platform.isMacOS) {
    // Check current tracking authorization status
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    // Request authorization if not determined
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
}
