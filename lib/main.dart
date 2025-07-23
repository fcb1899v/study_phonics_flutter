/// Study Phonics App - Main Entry Point
/// 
/// This app helps users learn phonics through interactive exercises.
/// Features include:
/// - Firebase Analytics for usage tracking
/// - AdMob integration for monetization
/// - Text-to-Speech functionality
/// - App Tracking Transparency (iOS)
/// 
/// Author: Nakajima Masao
/// Version: 1.5.3

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
import 'list_page.dart';

/// Main entry point of the application
/// 
/// Initializes all required services and configurations:
/// - Flutter binding
/// - Device orientation (portrait only)
/// - Environment variables
/// - Firebase services
/// - AdMob (Android only)
Future<void> main() async {
  // Ensure Flutter is initialized before any platform-specific code
  WidgetsFlutterBinding.ensureInitialized();
  // Lock device orientation to portrait mode for consistent UI
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Load environment variables from .env file
  await dotenv.load(fileName: "assets/.env");
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    name: "Study Phonics",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Start the app with Riverpod provider scope
  runApp(const ProviderScope(child: MyApp()));
  // Initialize AdMob only on Android platform
  if (Platform.isAndroid) MobileAds.instance.initialize();
}

/// Root widget of the application
/// 
/// Configures the MaterialApp with:
/// - Custom theme and fonts
/// - Navigation observers for analytics
/// - Platform-specific features
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
/// Requests tracking authorization on iOS/macOS platforms.
/// This is required for personalized ads and analytics on Apple platforms.
/// The function:
/// 1. Checks if the platform is iOS/macOS
/// 2. Gets current tracking authorization status
/// 3. Requests authorization if not determined
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
