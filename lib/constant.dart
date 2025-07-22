import 'package:flutter/material.dart';

//Common
const String myTitle = "Study Phonics";
const String myFont = "sfPro";

//Size
const double appBarFontSize = 28;
const double listTopMargin = 10;
const double listCharSize = 24;
const double listMargin = 3;
const double listPadding = 0;

//Phonics
const List<String> allPhonics = [
  "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h", "i", "i'", "j", "k",
  "l", "m", "n", "o", "p", "q", "r", "s", "s'", "t", "u", "v", "w", "x", "y", "z",
  "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e", "ou", "ow",
  "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear", "ue", "ui", "ew", "ōō", "ōū",
  "_u_e", "oo", "ai", "ay", "_a_e", "air", "ea", "au", "aw", "our", "oy",
  "oa", "ōw", "all", "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
];

//Color
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color transpColor = Colors.transparent;
const Color blueColor = Colors.lightBlue;
const Color pinkColor = Color.fromRGBO(255, 105, 180, 1); //'FF69B4'

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}