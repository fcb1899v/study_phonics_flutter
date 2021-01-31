
class AlphabetClass {

  // ignore: non_constant_identifier_names
  AlphabetDefault() {
    return [
      "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h",
      "i", "i'", "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "s'", "t", "u", "v", "w", "x", "y", "z",
    ];
  }

  alphabetWord(String word) {
    switch (word) { //:6
      case "a": return ["", "a", "pple", "", "a", "nt"];              //[ア]と[エ]の中間
      case "a'": return ["", "a", "corn", "", "a", "ngelfish"];       //[エイ]
      case "b": return ["", "b", "anana", "", "b", "ee"];             //[ブッ]
      case "c": return ["", "c", "innamon roll", "", "c", "icada"];   //[ス]:1
      case "c'": return ["", "c", "orn", "", "c", "at"];              //[クッ]
      case "d": return ["", "d", "onut", "", "d", "og"];              //[ドッ]
      case "e": return ["", "e", "gg", "", "e", "lephant"];           //[エ]
      case "f": return ["", "f", "lower", "", "f", "rog"];            //[フ]
      case "g": return ["", "g", "inger", "", "g", "iraffe"];         //[ジュッ]
      case "g'": return ["", "g", "rapes", "", "g", "orilla"];        //[グッ]
      case "h": return ["", "h", "amburger", "", "h", "orse"];        //[ハ]
      case "i": return ["", "i", "ndoor shoes", "", "i", "njector"];  //[アイ]
      case "i'": return ["", "i", "ce cream", "", "i", "sland"];      //[イ]と[エ]の中間:1
      case "j": return ["", "j", "uice", "", "j", "ellyfish"];        //[ジュッ]
      case "k": return ["", "k", "iwi", "", "k", "oala"];             //[クッ]
      case "l": return ["", "l", "emon", "", "l", "ion"];             //[ウッ]
      case "m": return ["", "m", "ango", "", "m", "antis"];           //[ム]
      case "n": return ["", "n", "ut", "", "n", "eedle"];             //[ン]
      case "o": return ["", "o", "range", "", "o", "strich"];         //[ア]と[オ]の中間
      case "p": return ["", "p", "ineapple", "", "p", "ig"];          //[プッ]
      case "q": return ["", "q", "uestion", "", "q", "uilt"];         //[クワッ]:2
      case "r": return ["", "r", "abbit", "", "r", "ainbow"];         //[ウルッ]
      case "s": return ["", "s", "weet potato", "", "s", "quirrel"];  //[ス]
      case "s'": return ["televi", "s", "ion", "chee", "s", "e"];     //[ズ]
      case "t": return ["", "t", "omato", "", "t", "iger"];           //[トッ]
      case "u": return ["", "u", "mbrella", "", "u", "p"];            //[ア] //1
      case "v": return ["", "v", "egetables", "", "v", "est"];        //[ヴ]
      case "w": return ["", "w", "atermelon", "", "w", "itch"];       //[ウッ]
      case "x": return ["", "x", "ylophone", "fo", "x", ""];          //[クス]
      case "y": return ["", "y", "ogurt", "", "y", "acht"];           //[ィヤ] //1
      case "z": return ["", "z", "ebra", "", "z", "ero"];         //[ズ] //1
      default: return ["","","", "","",""];
    }
  }

  alphabetPicture(String word) {
    switch (word) {
      case "a": return ["assets/image/apple.png", "assets/image/ant.png"];
      case "a'": return ["assets/image/acorn.png", "assets/image/angelfish.png"];
      case "b": return ["assets/image/banana.png", "assets/image/bee.png"];
      case "c": return ["assets/image/cinnamonroll.png", "assets/image/cicada.png"];
      case "c'": return ["assets/image/corn.png", "assets/image/cat.png"];
      case "d": return ["assets/image/donut.png", "assets/image/dog.png"];
      case "e": return ["assets/image/egg.png", "assets/image/elephant.png"];
      case "f": return ["assets/image/flower.png", "assets/image/frog.png"];
      case "g": return ["assets/image/ginger.png", "assets/image/giraffe.png"];
      case "g'": return ["assets/image/grapes.png", "assets/image/gorilla.png"];
      case "h": return ["assets/image/hamburger.png", "assets/image/horse.png"];
      case "i": return ["assets/image/indoorshoes.png", "assets/image/injector.png"];
      case "i'": return ["assets/image/icecream.png", "assets/image/island.png"];
      case "j": return ["assets/image/juice.png", "assets/image/jellyfish.png"];
      case "k": return ["assets/image/kiwi.png", "assets/image/koala.png"];
      case "l": return ["assets/image/lemon.png", "assets/image/lion.png"];
      case "m": return ["assets/image/mango.png", "assets/image/mantis.png"];
      case "n": return ["assets/image/nut.png", "assets/image/needle.png"];
      case "o": return ["assets/image/orange.png", "assets/image/ostrich.png"];
      case "p": return ["assets/image/pineapple.png", "assets/image/pig.png"];
      case "q": return ["assets/image/question.png", "assets/image/quilt.png"];
      case "r": return ["assets/image/rabbit.png", "assets/image/rainbow.png"];
      case "s": return ["assets/image/sweetpotato.png", "assets/image/squirrel.png"];
      case "s'": return ["assets/image/television.png", "assets/image/cheese.png"];
      case "t": return ["assets/image/tomato.png", "assets/image/tiger.png"];
      case "u": return ["assets/image/umbrella.png", "assets/image/up.png"];
      case "v": return ["assets/image/vegetables.png", "assets/image/vest.png"];
      case "w": return ["assets/image/watermelon.png", "assets/image/witch.png"];
      case "x": return ["assets/image/xylophone.png", "assets/image/fox.png"];
      case "y": return ["assets/image/yogurt.png", "assets/image/yacht.png"];
      case "z": return ["assets/image/zebra.png", "assets/image/zero.png"];
      default: return ["", ""];
    }
  }
}