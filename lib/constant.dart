/// Study Phonics App - Constants
/// 
/// Contains all constants used throughout the application including app configuration,
/// UI styling, phonics data, and utility functions.
/// 
/// Author: Nakajima Masao
/// Version: 1.5.3

import 'package:flutter/material.dart';

// =============================================================================
// APP CONFIGURATION
// =============================================================================

/// Application title displayed in the app bar and system
const String myTitle = "Study Phonics";
/// Custom font family used throughout the app
const String myFont = "sfPro";

// =============================================================================
// UI SIZING CONSTANTS
// =============================================================================

/// Font size for the app bar title
const double appBarFontSize = 28;
/// Top margin for list items
const double listTopMargin = 10;
/// Font size for characters in the list
const double listCharSize = 24;
/// Margin between list items
const double listMargin = 3;
/// Padding for list containers
const double listPadding = 0;

// =============================================================================
// PHONICS DATA
// =============================================================================

/// Complete list of phonics sounds taught in the app
/// Includes single letter sounds, vowel combinations, consonant blends,
/// special sounds, and silent letter patterns
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

// =============================================================================
// COLOR CONSTANTS
// =============================================================================

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
      hexColor = 'FF' + hexColor; // Add alpha channel if missing
    }
    return int.parse(hexColor, radix: 16);
  }
  /// Creates a color from hex string
  /// Example: HexColor("#FF0000") or HexColor("FF0000")
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// =============================================================================
// UI STYLING
// =============================================================================

/// Standard shadow for cards and elevated elements
/// Creates a subtle drop shadow with grey color, 2px spread, 4px blur, and 2px offset
BoxShadow myShadow() => BoxShadow(
  color: Colors.grey, // Shadow color
  spreadRadius: 2,    // How far the shadow spreads
  blurRadius: 4,      // How blurry the shadow is
  offset: Offset(2, 2), // Shadow offset from the element
);

// =============================================================================
// NAVIGATION ICONS
// =============================================================================

/// Navigation icons used in the app
/// Index mapping:
/// - 0: Reset button (keyboard_return icon)
/// - 1: Shuffle button (shuffle icon)
/// - 2: Back button (arrow_back icon)
/// - 3: Next button (arrow_forward icon)
List<IconData> icons = [
  Icons.keyboard_return,  // Reset functionality
  Icons.shuffle,          // Shuffle/reorder items
  Icons.arrow_back,       // Navigate back
  Icons.arrow_forward     // Navigate forward
];
