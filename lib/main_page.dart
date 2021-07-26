import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main_widget.dart';
import 'phonics.dart';

class MainPage extends StatefulWidget {
  const MainPage(this.index);
  final int index;
  @override
  _MainPageState createState() => _MainPageState(index);
}

class _MainPageState extends State<MainPage> {
  int index;
  _MainPageState(this.index);

  late List<String> phonicsList;
  late List<String> word;
  late List<String> picture;
  late List<String> sound;

  @override
  void initState() {
    super.initState();
    setState(() {
      phonicsList = [
        "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h",
        "i", "i'", "j", "k", "l", "m", "n", "o", "p", "q", "r",
        "s", "s'", "t", "u", "v", "w", "x", "y", "z",
        "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e",
        "ou", "ow", "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear",
        "ue", "ui", "ew", "ōō", "ōū", "_u_e", "oo", "ai", "ay", "_a_e",
        "air", "ea", "au", "aw", "our", "oy", "oa", "ōw", "all",
        "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
      ];
      word = phonicsList[index].phonicsWord();
      picture = phonicsList[index].phonicsPicture();
      sound = word.wordSound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () => Navigator.pop(context, true),
        ),
        title: appBarTitle(),
        brightness: Brightness.dark,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            alphabetChar(phonicsList[index]),
            Spacer(),
            alphabetWords(),
            Spacer(),
            Spacer(),
            operationButtons(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget operationButtons() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Spacer(),
          returnButton(),
          Spacer(),
          shuffleButton(phonicsList),
          Spacer(),
          backButton(phonicsList),
          Spacer(),
          forwardButton(phonicsList),
          Spacer(),
        ]
      ),
    );
  }

  Widget alphabetWords() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Spacer(),
          alphabetWordSet(0),
          Spacer(),
          (word[4] == "") ? SizedBox.shrink(): alphabetWordSet(1),
          Spacer(),
        ]
      ),
    );
  }

  Widget alphabetWordSet(num) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: <Widget>[
          alphabetWord(num),
          SizedBox(height: 10),
          alphabetPicture(num),
          SizedBox(height: 20),
          alphabetSound(num),
        ]
      )
    );
  }

  Widget alphabetWord(int num){
    return (word[4] == "") ? SizedBox.shrink(): TextButton(
      child: alphabetWordView(word, num),
      onPressed: () => sound[num].speakText(context),
    );
  }

  Widget alphabetPicture(int num) {
    return (word[4] == "") ? SizedBox.shrink(): TextButton(
      onPressed: () => sound[num].speakText(context),
      child: alphabetPictureView(context, picture, num),
    );
  }

  Widget alphabetSound(int num) {
    return (word[4] == "") ? SizedBox.shrink(): ElevatedButton(
      onPressed: () => sound[num].speakText(context),
      child: audioIcon(context),
      style: elevatedButtonStyle(Colors.lightBlue, 20),
    );
  }

  Widget returnButton(){
    return ElevatedButton(
      onPressed: () => setState(() {
        phonicsList = [
          "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h",
          "i", "i'", "j", "k", "l", "m", "n", "o", "p", "q", "r",
          "s", "s'", "t", "u", "v", "w", "x", "y", "z",
          "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e",
          "ou", "ow", "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear",
          "ue", "ui", "ew", "ōō", "ōū", "_u_e", "oo", "ai", "ay", "_a_e",
          "air", "ea", "au", "aw", "our", "oy", "oa", "ōw", "all",
          "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
        ];
        word = phonicsList[index].phonicsWord();
        picture = phonicsList[index].phonicsPicture();
        sound = word.wordSound();
      }),
      style: elevatedButtonStyle(HexColor('FF69B4'), 20),
      child: customIcon(context, Icons.keyboard_return),
    );
  }

  Widget shuffleButton(List<String> charList){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          phonicsList.shuffle();
          print("${phonicsList[index]}");
          word = phonicsList[index].phonicsWord();
          picture = phonicsList[index].phonicsPicture();
          sound = word.wordSound();
        });
      },
      style: elevatedButtonStyle(HexColor('FF69B4'), 20),
      child: customIcon(context, Icons.shuffle),
    );
  }

  Widget backButton(List<String> charList){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          phonicsList.insert(0, phonicsList[phonicsList.length - 1]);
          phonicsList.removeAt(phonicsList.length - 1);
          print("${phonicsList[index]}");
          word = phonicsList[index].phonicsWord();
          picture = phonicsList[index].phonicsPicture();
          sound = word.wordSound();
        });
      },
      style: elevatedButtonStyle(HexColor('FF69B4'), 20),
      child: customIcon(context, Icons.arrow_back),
    );
  }

  Widget forwardButton(List<String> charList){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          phonicsList.insert(phonicsList.length, phonicsList[0]);
          phonicsList.removeAt(0);
          print("${phonicsList[index]}");
          word = phonicsList[index].phonicsWord();
          picture = phonicsList[index].phonicsPicture();
          sound = word.wordSound();
        });
      },
      style: elevatedButtonStyle(HexColor('FF69B4'), 20),
      child: customIcon(context, Icons.arrow_forward),
    );
  }
}

