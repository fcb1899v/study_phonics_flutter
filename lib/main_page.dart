import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'admob_banner.dart';
import 'common_widget.dart';
import 'constant.dart';
import 'extension.dart';

class MainPage extends HookConsumerWidget {
  final int index;
  MainPage({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final FlutterTts flutterTts = FlutterTts();
    final counter = useState(index);
    final phonicsList = useState(allPhonics);
    var char = phonicsList.value[counter.value];
    var word = char.phonicsWord();
    var picture = char.phonicsPicture();
    var sound = char.phonicsWord().wordSound();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await flutterTts.setSharedInstance(true);
        await flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers,
            IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
          ]
        );
        await flutterTts.setVolume(1);
        await flutterTts.setLanguage("en-US");
        await flutterTts.setSpeechRate(0.5);
        "Counter: ${counter.value}".debugPrint();
        "PhonicsList: ${phonicsList.value}".debugPrint();
      });
      return null;
    }, []);

    operations(int i) {
      counter.value = counter.value.getCounterValue(i, index);
      phonicsList.value = phonicsList.value.getPhonicsListValue(i);
    }

    useEffect(() {
      char = phonicsList.value[counter.value];
      word = char.phonicsWord();
      picture = char.phonicsPicture();
      sound = char.phonicsWord().wordSound();
      return null;
    }, [counter.value, phonicsList.value]);

    return Scaffold(
      ///AppBar
      appBar: AppBar(
        leading: backButton(context),
        title: myAppBarText(),
        backgroundColor: blueColor,
        centerTitle: true,
      ),
      ///Body
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: context.sideMargin()),
        child: Column(children: [
          Spacer(flex: 1),
          ///Char
          GestureDetector(
            onTap: () => char.charSound().speakText(context, flutterTts),
            child: Row(children: List.generate((char.length == 1) ? 5: 3, (i) =>
              (i % 2 == 0) ? Spacer(): charWidget(context, char, i),
            )),
          ),
          Row(children: List.generate(5, (i) =>
            (i % 2 == 0) ? Spacer():
            GestureDetector(
              onTap: () => sound[(i - 1)~/2].speakText(context, flutterTts),
              child: Column(children: [
                wordWidget(context, word, i),
                pictureImage(context, picture[(i - 1)~/2]),
                audioButtonImage(context),
              ]),
            ),
          )),
          Row(children: List.generate(9, (i) =>
            (i == 2 || i == 6) ? SizedBox(width: context.buttonMargin()):
            (i % 2 == 0) ? Spacer():
            GestureDetector(
              onTap: () => operations((i - 1)~/2),
              child: operationButtonImage(context, icons[(i - 1)~/2]),
            ),
          )),
          Spacer(flex: 1),
          (Platform.isAndroid) ? AdBannerWidget(): SizedBox(height: context.admobHeight()),
        ]),
      ),
    );
  }
}

