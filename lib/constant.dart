import 'package:flutter/material.dart';

/// Constants used throughout the app: configuration, UI styling, phonics data
/// and utility functions.

// ===== APP CONFIGURATION =====

const String myTitle = "Study Phonics";
const String myFont = "sfPro";



// ===== UI SIZING CONSTANTS =====

const double appBarFontSize = 28;
const double listTopMargin = 10;
const double listCharSize = 24;/// Margin between list items
const double listMargin = 3;
const double listPadding = 0;

// ===== PHONICS DATA =====

/// All phonics sounds taught in the app: single letters, vowel combinations,
/// consonant blends, special sounds and silent letter patterns
const List<String> allPhonics = [
  // Single letter sounds
  "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h", "i", "i'", "j", "k",
  "l", "m", "n", "o", "p", "q", "r", "s", "s'", "t", "u", "v", "w", "x", "y", "z",
  // Vowel combinations and special sounds
  "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e", "ou", "ow",
  "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear", "ue", "ui", "ew", "ōō", "ōū",
  "_u_e", "oo", "ai", "ay", "_a_e", "air", "ea", "au", "aw", "our", "oy",
  "oa", "ōw", "all", "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
];

// ===== COLOR CONSTANTS =====

const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color transpColor = Colors.transparent;
const Color blueColor = Colors.lightBlue;
const Color pinkColor = Color.fromRGBO(255, 105, 180, 1); //'FF69B4'

/// Custom color class for hex color support
/// Allows creating colors from hex strings like "#FF0000" or "FF0000"
class HexColor extends Color {
  /// Converts hex string to integer color value
  /// Handles both 6-digit and 8-digit hex codes
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add alpha channel if missing
    }
    return int.parse(hexColor, radix: 16);
  }
  /// Creates a color from hex string
  /// Example: HexColor("#FF0000") or HexColor("FF0000")
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}

// ===== UI STYLING =====

/// Standard shadow for cards and elevated elements
/// Creates a subtle drop shadow with grey color, 2px spread, 4px blur, and 2px offset
BoxShadow myShadow() => BoxShadow(
  color: Colors.grey, // Shadow color
  spreadRadius: 2,    // How far the shadow spreads
  blurRadius: 4,      // How blurry the shadow is
  offset: Offset(2, 2), // Shadow offset from the element
);

// ===== NAVIGATION ICONS =====

/// Navigation icons, by index: 0 reset, 1 shuffle, 2 back, 3 next
List<IconData> icons = [
  Icons.keyboard_return,  // Reset functionality
  Icons.shuffle,          // Shuffle/reorder items
  Icons.arrow_back,       // Navigate back
  Icons.arrow_forward     // Navigate forward
];


// Google's published demo ad units, kept in source so a missing .env key cannot break debug builds.
// Adaptive unit, not the fixed 320x50 one (https://developers.google.com/admob/android/test-ads, checked 2026-09-02).
const String androidBannerTestId = "ca-app-pub-3940256099942544/9214589741";
