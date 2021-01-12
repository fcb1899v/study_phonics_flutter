import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:ui';
import 'list.dart';
import 'phonics.dart';
import 'word.dart';
import 'admob.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,//縦固定
  ]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  final lightblue = Colors.lightBlue; //水色
  final pink = HexColor('FF69B4'); //薄ピンク
  //final purple = HexColor('8A2BE2'); //薄紫

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Phonics',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: lightblue,
        accentColor: pink, //薄ピンク
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/list',
      routes: {
        // 初期画面のclassを指定
        '/home': (context) => MainPage(),
        // 次ページのclassを指定
        '/list': (context) => ListPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key, this.index}) : super(key: key);
  final dynamic index;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // ignore: top_level_instance_method
  var phonicslist = PhonicsClass().phonicsDefault();
  final lightblue = Colors.lightBlue; //水色
  final pink = HexColor('FF69B4'); //薄ピンク
  final purple = HexColor('8A2BE2'); //薄紫

  FlutterTts fluttertts;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  initTts() {
    fluttertts = FlutterTts();
    fluttertts.setLanguage('en-Us');
  }

  _speak(msg) {
    fluttertts.speak(msg);
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    final char = phonicslist[index];
    final word = PhonicsClass().phonicsWord(char);
    final deflist = PhonicsClass().phonicsDefault();
    String word2nd = word[4];

    return Scaffold(
      appBar: mainAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            adMobWidget(),
            Spacer(flex: 3),
            alphabetChar(index),
            Spacer(flex:  3),
            Row(
                children: <Widget>[
                  Spacer(flex: 10),
                  alphabetWordSet(index, 0),
                  customSpacer(10, word2nd),
                  alphabetWordSet(index, 1),
                  Spacer(flex: 10),
                ]
            ),
            Spacer(flex: 3),
            Row(
                children: <Widget>[
                  Spacer(flex: 20),
                  returnButton(),
                  Spacer(flex: 20),
                  customButton(phonicslist, "shuffle", Icons.shuffle),
                  Spacer(flex: 20),
                  customButton(phonicslist, "back", Icons.arrow_back),
                  Spacer(flex: 20),
                  customButton(phonicslist, "next", Icons.arrow_forward),
                  Spacer(flex: 20),
                ]
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }

  Widget mainAppBar() {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context,true);
          }),
      title: WordClass().AppBarTitle(),
      brightness: Brightness.dark,
      centerTitle: true,
    );
  }

  Widget adMobWidget() {
    return AdmobBanner(
      adUnitId: AdMobService().getBannerAdUnitId(),
      adSize: AdmobBannerSize(
        width: MediaQuery.of(context).size.width.toInt(),
        height: AdMobService().getHeight(context).toInt(),
        name: 'SMART_BANNER',
      ),
    );
  }

  Widget alphabetChar(index) {
    final size = MediaQuery.of(context).size;
    final charwidth = size.width - 20;
    //final sound = phonicslist[index];
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: charwidth,),
      onPressed: () {},
      child: WordClass().alphabetCharText(phonicslist, index),
    );
  }

  Widget alphabetWordSet(index, num) {
    return Container(
        child: Column(
            children: <Widget>[
              alphabetWord(index, num),
              clearImage(10),
              alphabetPicture(index, num),
              clearImage(30),
              alphabetWordSound(index, num),
            ]
        )
    );
  }

  Widget alphabetWord(index, num){
    final char = phonicslist[index];
    final word = PhonicsClass().phonicsWord(char);
    final sound = WordClass().wordSound(word, num);
    if (word[3 * num + 1] == "") {
      return SizedBox.shrink();
    } else {
      return TextButton(
        child: WordClass().makeWord(word, num, pink),
        onPressed: () {_speak(sound);},
      );
    }
  }

  Widget alphabetPicture(index, num) {
    final size = MediaQuery.of(context).size;
    final picwidth = size.width / 2 - 30;
    final char = phonicslist[index];
    final picture = PhonicsClass().phonicsPicture(char)[num];
    final word = PhonicsClass().phonicsWord(char);
    final sound = WordClass().wordSound(word, num);
    if (picture == "") {
      return SizedBox.shrink();
    } else {
      return TextButton(
          onPressed: () {_speak(sound);},
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(Size(picwidth, 120)),
            child: Image.asset(picture, width: picwidth, height: 120),
          )
      );
    }
  }

  Widget alphabetWordSound(index, num) {
    final size = MediaQuery.of(context).size;
    final buttonwidth = size.width / 2 - 30;
    final char = phonicslist[index];
    final word = PhonicsClass().phonicsWord(char);
    final sound = WordClass().wordSound(word, num);
    if (sound == "") {
      return SizedBox.shrink();
    } else {
      return RawMaterialButton(
        constraints: BoxConstraints(
          minWidth: buttonwidth,
          minHeight: 50,
        ),
        onPressed: (){_speak(sound);},
        fillColor: lightblue,
        child: WordClass().buttonIcon(Icons.audiotrack),
        shape: const StadiumBorder(),
      );
    }
  }

  Widget returnButton(){
    final size = MediaQuery.of(context).size;
    final buttonwidth = size.width / 4 - 30;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: buttonwidth,
        minHeight: 50,
      ),
      onPressed: (){
        setState(() {
          phonicslist = PhonicsClass().phonicsDefault();
        });
      },
      fillColor: pink,
      child: WordClass().buttonIcon(Icons.keyboard_return),
      shape: const StadiumBorder(),
    );
  }

  Widget customButton(charlist, command, icon){
    final size = MediaQuery.of(context).size;
    final buttonwidth = size.width / 4 - 30;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: buttonwidth,
        minHeight: 50,
      ),
      onPressed: (){
        setState(() {
          WordClass().changeState(charlist, command);
        });
      },
      fillColor: pink,
      child: WordClass().buttonIcon(icon),
      shape: const StadiumBorder(),
    );
  }

  Widget clearImage(double num) {
    String imagefile = "assets/image/clear.png";
    return Image.asset (imagefile, height: num,);
  }

  Widget customSpacer(num, string) {
    if (string == "") {
      return SizedBox.shrink();
    } else {
      return Spacer(flex: num);
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
