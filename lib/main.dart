import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:ui';
import 'list.dart';
import 'phonics.dart';
import 'word.dart';
import 'button.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,//縦固定
  ]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  final purple = HexColor('8A2BE2'); //薄紫
  final pink = HexColor('FF69B4'); //薄ピンク

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Phonics',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: purple,
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
  final lightblue = Colors.lightBlue;
  final pink = HexColor('FF69B4');

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
    String word2 = PhonicsClass().phonicsWord(phonicslist[index])[4];

    return Scaffold(
      appBar: mainAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 3),
            alphabetChar(index),
            Spacer(flex:  3),
            Row(
                children: <Widget>[
                  Spacer(flex: 10),
                  alphabetWordSet(index, 0),
                  customSpacer(10, word2),
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
                  shuffleButton(),
                  Spacer(flex: 20),
                  backButton(),
                  Spacer(flex: 20),
                  nextButton(),
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
      leading: new IconButton(
      icon: new Icon(Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: (){
        Navigator.pop(context,true);
      }),
      title: Text('Study Phonix',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
      brightness: Brightness.dark,
    );
  }

  Widget alphabetChar(index) {
    final Size size = MediaQuery.of(context).size;
    //final sound = phonicslist[index];
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width - 20,
      ),
      //onPressed: () {_speak(sound);},
      child: Text(
          phonicslist[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 125,
          )
      ),
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
    final word = PhonicsClass().phonicsWord(phonicslist[index]);
    final sound = word[3 * num] + word[3 * num + 1] + word[3 * num + 2];
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
    final Size size = MediaQuery.of(context).size;
    final picture = PhonicsClass().phonicsPicture(phonicslist[index])[num];
    final word = PhonicsClass().phonicsWord(phonicslist[index]);
    final sound = word[3 * num] + word[3 * num + 1] + word[3 * num + 2];
    if (picture == "") {
      return SizedBox.shrink();
    } else {
      return TextButton(
          onPressed: () {_speak(sound);},
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(Size(size.width / 2 - 30, 120)),
            child: Image.asset(picture, width: size.width / 2 - 30, height: 120),
          )
      );
    }
  }

  Widget alphabetWordSound(index, num) {
    final Size size = MediaQuery.of(context).size;
    final list = phonicslist[index];
    final word = PhonicsClass().phonicsWord(list);
    final sound = word[3 * num] + word[3 * num + 1] + word[3 * num + 2];
    if (sound == "") {
      return SizedBox.shrink();
    } else {
      return RawMaterialButton(
        constraints: BoxConstraints(
          minWidth: size.width / 2 - 30,
          minHeight: 50,
        ),
        onPressed: (){_speak(sound);},
        fillColor: lightblue,
        child: Icon(
          Icons.audiotrack,
          color: Colors.white,
          size: 30.0,
        ),
        shape: const StadiumBorder(),
      );
    }
  }

  Widget returnButton(){
    final Size size = MediaQuery.of(context).size;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width / 4 - 30,
        minHeight: 50,
      ),
      onPressed: (){
        setState(() {
          phonicslist = PhonicsClass().phonicsDefault();
        });
      },
      fillColor: pink,
      child: Icon(
        Icons.keyboard_return,
        color: Colors.white,
        size: 30.0,
      ),
      shape: const StadiumBorder(),
    );
  }

  Widget shuffleButton(){
    final Size size = MediaQuery.of(context).size;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width / 4 - 30,
        minHeight: 50,
      ),
      onPressed: (){
        setState(() {phonicslist.shuffle();});
      },
      fillColor: pink,
      child: Icon(
        Icons.shuffle,
        color: Colors.white,
        size: 30.0,
      ),
      shape: const StadiumBorder(),
    );
  }

  Widget backButton(){
    final Size size = MediaQuery.of(context).size;
    final listlength = phonicslist.length;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width / 4 - 30,
        minHeight: 50,
      ),
      onPressed: (){
        var phonixlast = phonicslist[listlength - 1];
        setState(() {
          phonicslist.insert(0, phonixlast);
          phonicslist.removeAt(listlength);
        });
      },
      fillColor: pink,
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 30.0,
      ),
      shape: const StadiumBorder(),
    );
  }

  Widget nextButton(){
    final Size size = MediaQuery.of(context).size;
    final listlength = phonicslist.length;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width / 4 - 30,
        minHeight: 50,
      ),
      onPressed: (){
        var phonixfirst = phonicslist[0];
        setState(() {
          phonicslist.insert(listlength, phonixfirst);
          phonicslist.removeAt(0);
        });
      },
      fillColor: pink,
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 30.0,
      ),
      shape: const StadiumBorder(),
    );
  }

  Widget customButton(BuildContext context, icon, command){
    final Size size = MediaQuery.of(context).size;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: size.width / 4 - 30,
        minHeight: 50,
      ),
      onPressed: (){setState(() {ButtonClass().changeState(command);});},
      fillColor: pink,
      child: Icon(icon,
        color: Colors.white,
        size: 30.0,
      ),
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
