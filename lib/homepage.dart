import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_phonics/tts_manager.dart';
import 'admob_banner.dart';
import 'constant.dart';
import 'extension.dart';

/// Main phonics learning page that displays phonics sounds, words, and images
/// Manages the interactive phonics learning interface with TTS functionality
class HomePage extends HookConsumerWidget {
  final int index;
  HomePage({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize TTS manager for text-to-speech functionality
    final ttsManager = useMemoized(() => TtsManager(context: context));
    // State management for current phonics index and list
    final counter = useState(index);
    final phonicsList = useState(allPhonics);
    // Current phonics data based on state
    var char = phonicsList.value[counter.value];
    var word = char.phonicsWord();
    var picture = char.phonicsPicture();
    var sound = char.phonicsWord().wordSound();
    // UI widget helper
    final main = MainWidget(context);

    // Initialize TTS and log initial state
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ttsManager.initTts();
        "Counter: ${counter.value}".debugPrint();
        "PhonicsList: ${phonicsList.value}".debugPrint();
      });
      return null;
    }, []);

    /// Handle navigation and list operations
    /// @param i Operation type: 0=original list, 1=shuffle, 2=back, 3=next
    operations(int i) {
      counter.value = counter.value.getCounterValue(i, index);
      phonicsList.value = phonicsList.value.getPhonicsListValue(i);
    }

    // Update phonics data when counter or list changes
    useEffect(() {
      char = phonicsList.value[counter.value];
      word = char.phonicsWord();
      picture = char.phonicsPicture();
      sound = char.phonicsWord().wordSound();
      return null;
    }, [counter.value, phonicsList.value]);

    return Scaffold(
      ///AppBar
      appBar: main.mainAppBar(),
      ///Body
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: context.sideMargin()),
        child: Column(children: [
          Spacer(flex: 1),
          ///Char
          Row(children: List.generate((char.length == 1) ? 5: 3, (i) =>
            (i % 2 == 0) ? Spacer(): main.charButton(char,
              isUpperCase: i == 1,
              onTap: () => ttsManager.speakText(char.charSound()),
            ),
          )),
          ///Word, Picture
          Row(children: List.generate(5, (i) =>
            (i % 2 == 0) ? Spacer():
            GestureDetector(
              onTap: () => ttsManager.speakText(sound[(i - 1)~/2]),
              child: Column(children: [
                main.wordWidget(word, i),
                main.pictureImage(picture[(i - 1)~/2]),
                main.audioButtonImage(),
              ]),
            ),
          )),
          Row(children: List.generate(9, (i) =>
            (i == 2 || i == 6) ? SizedBox(width: context.buttonMargin()):
            (i % 2 == 0) ? Spacer(): main.operationButton(
              icon: icons[(i - 1)~/2],
              onTap: () => operations((i - 1)~/2),
            ),
          )),
          Spacer(flex: 1),
          (Platform.isAndroid) ? AdBannerWidget(): SizedBox(height: context.admobHeight()),
        ]),
      ),
    );
  }
}

/// Helper class for creating UI components with consistent styling
/// Provides reusable widgets for the phonics learning interface
class MainWidget {

  final BuildContext context;

  MainWidget(this.context);

  /// Creates the main app bar with title and back button
  AppBar mainAppBar() => AppBar(
    leading: backButton(),
    title: Text(myTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: appBarFontSize,
        color: whiteColor,
        shadows: [myShadow()],
      ),
    ),
    backgroundColor: blueColor,
    centerTitle: true,
  );

  /// Creates back button with shadow effect
  IconButton backButton() => IconButton(
    icon: Icon(Icons.arrow_back_ios,
      color: whiteColor,
      shadows: [myShadow()],
    ),
    onPressed: () => Navigator.pop(context, true),
  );

  /// Creates interactive character button for phonics sound
  /// @param char The phonics character to display
  /// @param isUpperCase Whether to display in uppercase
  /// @param onTap Callback function when button is tapped
  charButton(String char, {
    required bool isUpperCase,
    required void Function() onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.charWidth(char),
      height: context.charHeight(),
      margin: EdgeInsets.only(bottom: context.wordSpace()),
      alignment: Alignment.center,
      child: Text(isUpperCase ? char : char.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: context.charSize(),
          shadows: [myShadow()],
        ),
      ),
    )
  );

  /// Creates word widget with highlighted phonics sound
  /// @param word List of word parts [prefix, sound, suffix]
  /// @param i Index for word selection
  wordWidget(List<String> word, int i) => Container(
    alignment: Alignment.center,
    width: context.picSize(),
    margin: EdgeInsets.only(bottom: context.wordSpace()),
    child: RichText(
      text: TextSpan(
        style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: context.wordSize(),
          shadows: [myShadow()],
        ),
        children: List.generate(3, (j) => TextSpan(
          text: word[3 * ((i - 1) ~/ 2) + j],
          style: j == 1 ? TextStyle(
            color: pinkColor,
            decoration: TextDecoration.underline,
          ) : null,
        )),
      ),
    ),
  );

  /// Creates image container for phonics word illustration
  /// @param picture Asset path for the image
  pictureImage(String picture) => Container(
    width: context.picSize(),
    height: context.picSize(),
    margin: EdgeInsets.only(bottom: context.wordSpace()),
    child: Image.asset(picture),
  );

  /// Creates audio button with play icon
  audioButtonImage() => Container(
    width: context.picSize(),
    height: context.buttonHeight(),
    margin: EdgeInsets.only(bottom: context.wordSpace()),
    decoration: BoxDecoration(
      color: blueColor,
      borderRadius: BorderRadius.circular(context.buttonRadius()),
      boxShadow: [myShadow()],
    ),
    child: Icon(
      Icons.audiotrack,
      color: whiteColor,
      size: context.buttonIconSize(),
      shadows: [myShadow()],
    ),
  );

  /// Creates operation button for navigation and list management
  /// @param icon Icon to display on the button
  /// @param onTap Callback function when button is tapped
  operationButton({
    required IconData icon,
    required void Function() onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.buttonWidth(),
      height: context.buttonHeight(),
      decoration: BoxDecoration(
        color: pinkColor,
        borderRadius: BorderRadius.circular(context.buttonRadius()),
        boxShadow: [myShadow()],
      ),
      child: Icon(icon,
        color: whiteColor,
        size: context.buttonIconSize(),
        shadows: [myShadow()],
      ),
    ),
  );
}

