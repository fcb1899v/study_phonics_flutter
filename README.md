# Study Phonics - Interactive Phonics Learning App

<div align="center">
  <img src="assets/icon/icon.png" alt="Study Phonics Icon" width="120" height="120">
  <br>
  <strong>Learn phonics easily and effectively</strong>
  <br>
  <strong>Interactive phonics learning with text-to-speech</strong>
</div>

## 📱 Application Overview

Study Phonics is a Flutter app for Android & iOS that teaches English phonics.
Each sound opens a page with example words, their images, and text-to-speech playback.

### 🎯 Key Features

- **Phonics Coverage**: 77 sounds in `allPhonics` (`lib/constant.dart`), covering single letters, vowel combinations, blends, and silent letter patterns
- **Text-to-Speech**: Pronunciation for every sound and example word through `flutter_tts`
- **Cross-platform Support**: Android & iOS
- **Interactive Learning**: Tap a sound or word to hear it
- **Visual Learning Aids**: two example images per sound; `lib/extension.dart` references 156 of the 169 files in `assets/image/`
- **Firebase Analytics**: Android only, gated by `Platform.isAndroid` in `lib/main.dart`
- **AdMob Banner**: Android only, with the UMP consent flow in `lib/admob_banner.dart`
- **Responsive Design**: Grid and type sizes derived from the screen size

## 🚀 Technology Stack

### Frameworks & Libraries
- **Flutter**: 3.47.0+
- **Dart**: 3.13.0+
- **Firebase**: `firebase_core` and `firebase_analytics`, the only Firebase packages in `pubspec.yaml`, initialized on Android only
- **Google Mobile Ads**: Banner ads and UMP consent (Android only)

### Core Features
- **Text-to-Speech**: `flutter_tts`, vendored at `packages/flutter_tts`
- **State Management**: hooks_riverpod, flutter_hooks
- **Environment Variables**: flutter_dotenv
- **App Icons**: flutter_launcher_icons
- **Splash Screen**: flutter_native_splash

### The flutter_tts fork is local on purpose

`pubspec.yaml` points `flutter_tts` at `packages/flutter_tts`, not at pub.dev.
The published 4.2.5 has no Swift Package Manager manifest, so depending on it would put CocoaPods back into the iOS build.
The fork adds the SPM manifests and branches `android/build.gradle` on `android.builtInKotlin` for AGP 9; the Dart sources are unchanged.

## 📋 Prerequisites

- Flutter 3.47.0+ (required by Android Gradle Plugin 9: earlier versions force the Kotlin Gradle Plugin onto modules that AGP 9 compiles itself)
- Dart 3.13.0+
- Android Studio / Xcode
- Firebase project with Analytics, for Android builds

## 🛠️ Setup

### 1. Clone the Repository
```bash
git clone https://github.com/fcb1899v/study_phonics_flutter.git
cd study_phonics_flutter
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configuration Files Setup

**Environment variables.** Copy `assets/.env_example` to `assets/.env` and fill in the values.
The template lists every key with what it is for, and is the one place that list is maintained.
`pubspec.yaml` declares `assets/.env`, so the file has to exist or the build fails.
Debug builds use Google's demo ad units and need no real ids, and the demo unit for an inline adaptive request is not the same id as the fixed-size one.

**Android signing, release only.** Copy `android/key.properties.example` to `android/key.properties` and fill it in.
Nothing in it ships inside the app, and the two passwords are real secrets: together with the keystore they let anyone publish an update Play accepts as coming from you.
Keep the keystore outside the repository and back both up.
`android/app/build.gradle` defines the release signing config, and attaches it to the release build type, only when all four values are present.

### 4. Firebase Configuration

Firebase is initialized on Android only: `lib/main.dart` initializes it inside `if (Platform.isAndroid)`, and `ios/Runner.xcodeproj/project.pbxproj` contains no reference to a GoogleService file.

1. Create a Firebase project and add an Android app with the application id `com.nakajimamasao.studyphonics`.
2. Download `google-services.json` from Project settings > Your apps and place it in `android/app/`.
3. Run `flutterfire configure` to generate `lib/firebase_options.dart`, which `lib/main.dart` imports.
4. Both files are git-ignored, so a fresh clone has to fetch and regenerate them before the Android build will run.

### 5. Run the Application
```bash
# Android
flutter run -d <android-device-id>

# iOS (Swift Package Manager: there is no Podfile to install)
flutter run -d <ios-device-id>
```

## 🎮 Application Structure

```
lib/
├── main.dart                    # Application entry point
├── list_page.dart               # Phonics selection grid, the first screen
├── homepage.dart                # Phonics learning page
├── tts_manager.dart             # Text-to-speech management
├── admob_banner.dart            # Banner ad and UMP consent, Android only
├── constant.dart                # Constant definitions and the phonics list
├── extension.dart               # Extension functions, word and image data
└── firebase_options.dart        # Generated by flutterfire configure, git-ignored

assets/
├── image/                       # 169 PNG files, 156 of them referenced by extension.dart
├── fonts/                       # SF-Pro.ttf
├── icon/                        # icon.png, appIcon.png, splash.png
├── .env_example                 # Environment variable template
└── .env                         # Environment variables, git-ignored
```

## 📱 Supported Platforms

- **Android**: API 24+ (`flutter.minSdkVersion`), compiled and targeted against SDK 37
- **iOS**: iOS 15.0+ (`IPHONEOS_DEPLOYMENT_TARGET` on the Runner target)

## 🔧 Development

### Code Analysis
```bash
flutter analyze   # expected: No issues found!
```

### Run Tests

This repository has no `test/` directory, so `flutter test` has nothing to run.
`flutter analyze` is the check that runs clean and is expected to stay that way.

### Build
```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios
```

### Generate App Icons
```bash
dart run flutter_launcher_icons
```

### Generate Splash Screen
```bash
dart run flutter_native_splash:create
```

## 📄 License

This project is not open source.
The source is published so that it can be read, and all rights are reserved.
See [LICENSE](LICENSE) for what that permits.
Third-party components keep their own licenses, listed below.

## 🤝 Contributing

Issue reports are welcome.
Pull requests are not accepted, because the code is not licensed for redistribution.

## 📞 Support

If you have any problems or questions, please create an issue on GitHub.

## Licenses & Credits

This app uses the following third-party components:

- Flutter (BSD 3-Clause License)
- firebase_core, firebase_analytics (BSD 3-Clause License)
- google_mobile_ads (Apache License 2.0)
- Google Mobile Ads Android SDK (Android Software Development Kit License): `play-services-ads`, pulled in by google_mobile_ads
- Google Mobile Ads iOS SDK (proprietary Google binary; its CocoaPods spec declares only a Google copyright notice, with no open-source license): `Google-Mobile-Ads-SDK`, pulled in by google_mobile_ads
- User Messaging Platform, the consent SDK (Android Software Development Kit License): `com.google.android.ump:user-messaging-platform`, pulled in by google_mobile_ads
- User Messaging Platform on iOS (proprietary Google binary, declared the same way as the iOS ads SDK): `GoogleUserMessagingPlatform`, pulled in by `Google-Mobile-Ads-SDK`
- flutter_dotenv (MIT License)
- flutter_tts (MIT License), vendored at `packages/flutter_tts`
- hooks_riverpod, flutter_hooks (MIT License)
- cupertino_icons (MIT License)
- flutter_launcher_icons (MIT License)
- flutter_native_splash (MIT License)

For details of each license, please refer to [pub.dev](https://pub.dev/) or the LICENSE file in each repository.

