import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WordClass {

  Widget makeWord(List word, num, color){

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

}