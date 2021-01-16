import 'package:flutter/material.dart';
import 'main.dart';
import 'phonics.dart';
import 'word.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {

  // ignore: top_level_instance_method
  final phonicslist = PhonicsClass().phonicsDefault();
  final lightblue = Colors.lightBlue;
  final pink = HexColor('FF69B4'); //薄ピンク
  final purple = HexColor('8A2BE2'); //薄紫

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: listAppBar(),
        body: listMain(),
        ),
      );
  }

  Widget listMain() {
    return GridView.count(
        crossAxisCount: 4, // 1行に表示する数
        crossAxisSpacing: 4.0, // 縦スペース
        mainAxisSpacing: 4.0, // 横スペース
        //shrinkWrap: true,
        children: List.generate(phonicslist.length, (index) {
            return gridWordList(index);
        })
    );
  }

  Widget listAppBar() {
    return AppBar(
      title: WordClass().AppBarTitle(),
      brightness: Brightness.dark,
      backgroundColor: pink,
      centerTitle: true,
    );
  }

  Widget gridWordList(index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lightblue,
      ),
      child:GridTile(
        child: TextButton(
          child: Text(phonicslist[index],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(index: index)
              ),
            );
          },
        ),
      ),
    );
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