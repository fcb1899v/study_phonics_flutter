import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'phonics.dart';

class WordClass {

  wordSound(word, num) {
    return word[3 * num] + word[3 * num + 1] + word[3 * num + 2];
  }

  changeState(charlist, command) {
    final listlength = charlist.length;
    switch (command) {
      case "shuffle":
        charlist.shuffle();
        break;
      case "back":
        var charlast = charlist[listlength - 1];
        charlist.insert(0, charlast);
        charlist.removeAt(listlength);
        break;
      case "next":
        var charfirst = charlist[0];
        charlist.insert(listlength, charfirst);
        charlist.removeAt(0);
    }
  }

  Widget AppBarTitle(){
    return Text('Study Phonics',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget makeWord(word, num, color){
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        children: [
          TextSpan(text: word[3 * num]),
          TextSpan(text: word[3 * num + 1],
            style: TextStyle(
              color: color,
              decoration: TextDecoration.underline,
            )
          ),
          TextSpan(text: word[3 * num + 2]),
        ],
      )
    );
  }

  Widget alphabetCharText(char, index) {
    return Text(
        char[index],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 125,
        )
    );
  }

  Widget buttonIcon(icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 30.0,
    );
  }
}