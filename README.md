# Study Phonics - Interactive Phonics Learning App

<div align="center">
  <img src="assets/icon/icon.png" alt="Study Phonics Icon" width="120" height="120">
  <br>
  <strong>Learn phonics easily and effectively</strong>
  <br>
  <strong>Interactive phonics learning with text-to-speech</strong>
</div>

## 📱 Application Overview

Study Phonics is a Flutter-based educational app for Android & iOS that helps users learn phonics through interactive exercises.
It provides an engaging learning experience through text-to-speech functionality, visual aids, and comprehensive phonics coverage.

### 🎯 Key Features

- **Comprehensive Phonics Coverage**: 60 phonics sounds including single letters, blends, and special sounds
- **Text-to-Speech Integration**: High-quality voice pronunciation for each sound
- **Cross-platform Support**: Android & iOS compatibility
- **Interactive Learning**: Tap to hear sounds and practice pronunciation
- **Visual Learning Aids**: 169 word images with clear typography
- **Firebase Analytics**: Track learning progress and app usage
- **AdMob Integration**: Banner ads for monetization
- **Responsive Design**: Adapts to different screen sizes
- **App Tracking Transparency**: iOS privacy compliance

## 🚀 Technology Stack

### Frameworks & Libraries
- **Flutter**: 3.3.0+
- **Dart**: 2.18.0+
- **Firebase**: Analytics
- **Google Mobile Ads**: Banner advertisement display

### Core Features
- **Text-to-Speech**: flutter_tts
- **State Management**: hooks_riverpod, flutter_hooks
- **Environment Variables**: flutter_dotenv
- **App Tracking Transparency**: app_tracking_transparency
- **App Icons**: flutter_launcher_icons
- **Splash Screen**: flutter_native_splash

## 📋 Prerequisites

- Flutter 3.47.0+ (required by Android Gradle Plugin 9: earlier versions
  force the Kotlin Gradle Plugin onto modules that AGP 9 compiles itself)
- Dart 3.13.0+
- Android Studio / Xcode
- Firebase (Analytics)

## 🛠️ Setup

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/study_phonics.git
cd study_phonics
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Environment Variables Setup
Create `assets/.env` file and configure required environment variables:
```env
# Add any environment variables if needed
# Currently using default configurations
```

### 4. Firebase Configuration
1. Create a Firebase project
2. Place `google-services.json` (Android) in `android/app/`
3. Place `GoogleService-Info.plist` (iOS) in `ios/Runner/`
4. These files are tracked here. The Gradle plugin fails the Android build
   without the json, and the Xcode project lists the plist in its Resources
   phase, so excluding them only broke fresh clones. They carry the same
   identifiers as `lib/firebase_options.dart`, which ship inside the app.
   Real secrets stay out: the keystore and the environment file

### 5. Run the Application
```bash
# Android
flutter run

# iOS (Swift Package Manager: there is no Podfile to install)
flutter run
```

## 🎮 Application Structure

```
lib/
├── main.dart                    # Application entry point
├── main_page.dart               # Main phonics learning page
├── list_page.dart               # Phonics selection grid
├── tts_manager.dart             # Text-to-speech management
├── admob_banner.dart            # Banner advertisement management
├── common_widget.dart           # Common widgets
├── constant.dart                # Constant definitions
├── extension.dart               # Extension functions
└── firebase_options.dart        # Firebase configuration

assets/
├── image/                       # Phonics learning images
│   ├── acorn.png               # Word images for each sound
│   ├── apple.png
│   ├── banana.png
│   └── ...                     # 169 word images total
├── fonts/                       # Font files
│   └── SF-Pro.ttf              # Custom font
├── icon/                        # App icons
│   ├── icon.png
│   ├── appIcon.png
│   └── splash.png
└── .env                         # Environment variables
```

## 🎨 Phonics Content

### Single Letter Sounds (30 sounds)
- **a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z**
- **a', c', g', i', s'** (Alternative pronunciations)

### Vowel Combinations & Special Sounds (30 sounds)
- **ai, ay, ea, au, aw, oa, oo, ou, ow, ue, ui, ew, oy**
- **er, ir, or, ur, ear, eer, air, our**
- **ie, igh, ey, ēē, ēā, īē, ōō, ōū, ōw**
- **Silent letter patterns**: _a_e, _e_e, _i_e, _u_e
- **Special sounds**: -y, all, ph, ch, sh, th, th', wh, ck, ng, lly

## 📱 Supported Platforms

- **Android**: API 23+ (Android 6.0+)
- **iOS**: iOS 14.0+
- **Web**: Coming soon

## 🔧 Development

### Code Analysis
```bash
flutter analyze
```

### Run Tests

There are none. The `flutter create` counter test was removed on 2026-09-02
because it asserted on a widget this app does not have and could only ever fail,
which made a red `flutter test` indistinguishable from a real failure.

`flutter analyze` is the check that runs clean and is expected to stay that way.

```bash
flutter analyze   # expected: No issues found!
```

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
flutter pub run flutter_launcher_icons:main
```

### Generate Splash Screen
```bash
flutter pub run flutter_native_splash:create
```

## 🎯 Learning Features

### Interactive Learning
- **Tap to Hear**: Tap any phonics sound to hear pronunciation
- **Visual Aids**: Each sound has associated word images (169 total)
- **Progress Tracking**: Firebase Analytics tracks learning progress

### Text-to-Speech Features
- **High-Quality Voices**: Platform-optimized voice selection
- **Clear Pronunciation**: Optimized speech rate for learning
- **Multi-language Support**: Ready for international expansion

### User Experience
- **Responsive Design**: Adapts to different screen sizes
- **Intuitive Navigation**: Simple grid-based selection
- **Accessibility**: Large text and clear contrast

## 🔒 Security

This project includes security measures to protect sensitive information:
- Environment variables for API keys
- Firebase configuration files are excluded from version control
- Ad unit IDs are stored in environment files
- Keystore files are properly excluded

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

Pull requests and issue reports are welcome. Please ensure your code follows the existing style and includes appropriate tests.

## 📞 Support

If you have any problems or questions, please create an issue on GitHub.

## 🚀 Getting Started

For new developers:
1. Follow the setup instructions above
2. Check the application structure
3. Review the phonics content organization
4. Start with the main.dart file to understand the app flow
5. Explore the tts_manager.dart for text-to-speech functionality

---

<div align="center">
  <strong>Study Phonics</strong> - Making phonics learning fun and effective!
</div>

## Licenses & Credits

This app uses the following open-source libraries:

- Flutter (BSD 3-Clause License)
- firebase_core, firebase_analytics (Apache License 2.0)
- google_mobile_ads (Apache License 2.0)
- flutter_dotenv (MIT License)
- flutter_tts (BSD 3-Clause License)
- hooks_riverpod, flutter_hooks (MIT License)
- cupertino_icons (MIT License)
- flutter_launcher_icons (MIT License)
- flutter_native_splash (MIT License)
- app_tracking_transparency (MIT License)

For details of each license, please refer to [pub.dev](https://pub.dev/) or the LICENSE file in each repository.

## 📊 Analytics & Privacy

- **Firebase Analytics**: Tracks app usage and learning progress
- **App Tracking Transparency**: iOS privacy compliance
- **AdMob**: Banner ads for monetization

## 🎓 Educational Value

Study Phonics is designed to help:
- **Early Readers**: Learn basic phonics sounds
- **ESL Students**: Practice English pronunciation
- **Special Education**: Visual and auditory learning support
- **Parents & Teachers**: Educational tool for phonics instruction

---

<div align="center">
  <strong>Study Phonics</strong> - Empowering learners through interactive phonics education!
</div>
