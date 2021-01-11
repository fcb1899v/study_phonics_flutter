import 'package:flutter/material.dart';
import 'phonics.dart';


class ButtonClass {

  var phonicslist = PhonicsClass().phonicsDefault();
  final pink = HexColor('FF69B4');

  void changeState(command) {
    final listlength = phonicslist.length;
    switch (command) {
      case "return":
        phonicslist = PhonicsClass().phonicsDefault();
        break;
      case "shuffle":
        phonicslist.shuffle();
        break;
      case "back":
        var phonixlast = phonicslist[listlength - 1];
        phonicslist.insert(0, phonixlast);
        phonicslist.removeAt(listlength);
        break;
      case "next":
        var phonixfirst = phonicslist[0];
        phonicslist.insert(listlength, phonixfirst);
        phonicslist.removeAt(0);
    }
  }
}

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
