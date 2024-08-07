import 'package:flutter/material.dart';
import 'constant.dart';
import 'extension.dart';

Widget appBarTitle() =>
    Center(
      child: Text('Study Phonics',
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: appBarFontSize,
        ),
      ),
    );

EdgeInsets mainPadding(double width) =>
    EdgeInsets.only(
      left: width * mainPaddingRate,
      right: width * mainPaddingRate,
    );

Widget charView(double width, String char) =>
    Text(char,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: blackColor,
        fontSize: width * charSizeRate,
      ),
    );

Widget wordView(double width, List<String> word, int num) =>
    RichText(
      text: TextSpan(
        style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: width * wordSizeRate,
        ),
        children: [
          TextSpan(text: word[3 * num]),
          TextSpan(text: word[3 * num + 1],
            style: TextStyle(
              color: pinkColor,
              decoration: TextDecoration.underline,
            )
          ),
          TextSpan(text: word[3 * num + 2]),
        ],
      ),
    );

Widget pictureView(double width, String picture) =>
    SizedBox(
      width: width.picWidth(),
      height: width.picHeight(),
      child: Image.asset(picture),
    );

ButtonStyle audioButtonStyle() =>
    ElevatedButton.styleFrom(
      primary: blueColor, //ボタンの背景色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(buttonRadius),
        ),
      ),
    );

Widget audioIcon(double width) =>
    SizedBox(
      width: width * audioButtonWidthRate,
      height: buttonHeight,
      child: Icon(Icons.audiotrack,
        color: whiteColor,
        size: buttonIconSize,
      ),
    );

Widget operationIcon(double width, IconData icon) =>
    SizedBox(
      width: width * operationButtonWidthRate,
      height: buttonHeight,
      child: Icon(icon,
        color: whiteColor,
        size: buttonIconSize,
      ),
    );

ButtonStyle operationButtonStyle() =>
    ElevatedButton.styleFrom(
      primary: pinkColor, //ボタンの背景色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(buttonRadius),
        ),
      ),
    );