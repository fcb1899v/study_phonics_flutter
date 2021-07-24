import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

extension StringExt on String {

  Future<void> speakText(BuildContext context) async {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage('en-Us');
    //flutterTts.setSpeechRate(0.5);
    await flutterTts.stop();
    await flutterTts.speak(this);
  }
}

extension ListStringExt on List<String> {

  List<String> wordSound() {
    return [
      "${this[0]}${this[1]}${this[2]}",
      "${this[3]}${this[4]}${this[5]}"
    ];
  }

  Future<void> changeState(String command) async {
    if (command == "shuffle") {
      this.shuffle();
    } else if (command == "back") {
      this.insert(0, this[this.length - 1]);
      await this.removeAt(this.length);
    } else if (command == "next") {
      this.insert(this.length, this[0]);
      await this.removeAt(0);
    }
  }
}

extension DoubleExt on double {

  double picWidth() {
    return (this < 620) ? this / 2 - 60: 250;
  }

  double picHeight() {
    return (this < 620) ? this / 2 - 60: 250;
  }


}
