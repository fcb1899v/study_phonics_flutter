import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'list_page.dart';
import 'constant.dart';

/// Main Entry Point
/// Main entry point of the application
/// Initializes Flutter, Firebase, AdMob, and starts the app
// No ATT call here. On iOS the UMP form shows Google's IDFA explainer and then
// raises the system ATT prompt itself, so asking again from the app put a second
// explainer in front of a user who had already answered. Removed in NEO first;
// see 03_Developer/technical/2026-08-25_elevatorneo_att_gate_removal.md
Future<void> main() async {
  // Ensure Flutter is initialized before platform-specific code
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Configure system UI, orientation, and platform-specific styling
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  } else {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
  // Load environment variables from .env file
  await dotenv.load(fileName: "assets/.env");
  // Initialize Firebase with platform-specific options
  if (Platform.isAndroid) await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: "Study Phonics");
  // Start the app with Riverpod provider scope
  runApp(const ProviderScope(child: MyApp()));
  // Initialize Google Mobile Ads for Android platform
  // Android only: no ad is requested on iOS. homepage.dart shows a plain
  // SizedBox there instead of AdBannerWidget, and initialize() is gated below,
  // so nothing on iOS ever reaches the ads SDK.
  //
  // Info.plist still carries GADApplicationIdentifier and it names this app's
  // own AdMob iOS app, which is registered and has a store id. The key cannot
  // be dropped while the plugin is linked, and naming Google's sample app there
  // would put another publisher's id in a shipping build for no gain. Setting
  // it correctly requests no ads; the gates below decide that.
  if (Platform.isAndroid) MobileAds.instance.initialize();
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

