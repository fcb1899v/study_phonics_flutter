import 'alphabet.dart';

class PhonicsClass {

  phonicsDefault() {
    return [
      ...AlphabetClass().AlphabetDefault(),
      "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e", "ou", "ow",
      "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear",
      "ue", "ui", "ew", "ōō", "ōū", "_u_e", "oo",
      "ai", "ay", "_a_e", "air", "ea",
      "au", "aw", "our", "oy", "oa", "ōw", "all",
      "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
    ];
  }

  phonicsWord(String word) {
    switch (word) {
    //[アー]
      case "er": return ["hamst","er","", "cucumb","er",""];
      case "ir": return ["g","ir","l", "t-sh","ir","t"];
      case "or": return ["elevat","or","", "escalat","or",""];
      case "ur": return ["t","ur","tle", "b","ur","dock"];
      case "ear'": return ["","ear","th", "h","ear","t"];
    //[アィ]
      case "ie": return ["meat p","ie","", "neck t","ie",""];
      case "igh": return ["traffic l","igh","t", "e","igh","t"];
      case "-y": return ["cherr","y","", "butterfl","y",""];
      case "_i_e": return ["", "fire"," engine", "","nine",""];
    //[アゥ]
      case "ou": return ["m","ou","se", "h","ou","se"];
      case "ow": return ["c","ow","", "t","ow","er"];
    //[イー]
      case "ēē": return ["b","ee","tle", "coff","ee",""];
      case "ēā": return ["p","ea","ch", "","ea","gle"];
      case "īē": return ["cook","ie","", "zomb","ie",""];
      case "ey": return ["hon","ey","", "monk","ey",""];
      case "_e_e": return ["centi","pede","", "conc","rete",""]; //1
    //[イァ]
      case "eer": return ["d","eer","", "b","eer",""];
      case "ear": return ["","ear","", "g","ear",""]; //1
    //[ウー]
      case "ue": return ["bl","ue","berry", "tiss","ue",""];
      case "ui": return ["passion fr","ui","t", "s","ui","t"]; //
      case "ew": return ["st","ew","", "n","ew","spaper"]; //1
      case "ōō": return ["bad t","oo","th", "kangar","oo",""];
      case "ōū": return ["s","ou","p", "r","ou","ge"];
      case "_u_e": return ["per","fume","", "sugar ","cube",""]; //2
    //[ウッ]
      case "oo": return ["g","oo","d", "b","oo","kstore"];
    //[エィ]:1
      case "ai": return ["tr","ai","n", "sn","ai","l"];
      case "ay": return ["ok","ay","", "manta r","ay",""]; //1
      case "_a_e": return ["","cake","", "s","nake",""];
    //[エァ]
      case "air": return ["","air","plane", "h","air","dryer"];
    //[エ]:1
      case "ea": return ["br","ea","d", "f","ea","ther"];
    //[オー]:4
      case "au": return ["Santa Cl","au","s", "s","au","sage"];
      case "aw": return ["str","aw","berry", "see s","aw",""];
      case "our": return ["c","our","t", "f","our",""]; //1
    //[オィ]
      case "oy": return ["b","oy","", "s","oy","beans"];
    //[オゥ]:2
      case "oa": return ["g","oa","t", "t","oa","st"];
      case "ōw": return ["sn","ow","man", "","ow","l"];
      case "_o_e": return ["","rose","", "tad","pole",""];
    //[オーゥ]:2
      case "all": return ["b","all","", "m","all",""];
    //[フ]:
      case "ph": return ["dol","ph","in", "smart","ph","one"];
    //[チュッ]:
      case "ch": return ["","ch","ocolate", "","ch","icken"];
    //[シュ]:
      case "sh": return ["mu","sh","room", "","sh","ark"];
    //[ス]:
      case "th": return ["","th","under", "","th","ree"];
    //[ズ]:
      case "th'": return ["mo","th","er", "rhy","th","m"];
    //[ハウッ]
      case "wh": return ["","wh","ale", "ferris ","wh","eel"];
    //[クッ]
      case "ck": return ["du","ck","", "clo","ck",""];
    //[ングゥ]
      case "ng": return ["puddi","ng","", "fryi","ng"," pan"];
    //[リィ]:4
      case "lly": return ["je","lly","", "be","lly",""]; //2
      default: return AlphabetClass().alphabetWord(word);
    }
  }

  phonicsPicture(String word) {
    switch (word) {
    //[アー]
      case "er": return ["assets/image/hamster.png", "assets/image/cucumber.png"];
      case "ir": return ["assets/image/girl.png", "assets/image/t-shirt.png"];
      case "or": return ["assets/image/elevator.png", "assets/image/escalator.png"];
      case "ur": return ["assets/image/turtle.png", "assets/image/burdock.png"];
      case "ear'": return ["assets/image/earth.png", "assets/image/heart.png"];
    //[アィ]:3
      case "ie": return ["assets/image/meatpie.png", "assets/image/necktie.png"]; //2
      case "igh": return ["assets/image/trafficlight.png", "assets/image/eight.png"];
      case "-y": return ["assets/image/cherry.png", "assets/image/butterfly.png"];
      case "_i_e": return ["assets/image/fireengine.png", "assets/image/nine.png"]; //1
    //[アゥ]
      case "ou": return ["assets/image/mouse.png", "assets/image/house.png"];
      case "ow": return ["assets/image/cow.png", "assets/image/tower.png"];
    //[イー]:2
      case "ēē": return ["assets/image/beetle.png", "assets/image/coffee.png"];
      case "ēā": return ["assets/image/peach.png", "assets/image/eagle.png"];
      case "īē": return ["assets/image/cookie.png", "assets/image/zombie.png"]; //2
      case "ey": return ["assets/image/honey.png", "assets/image/monkey.png"];
      case "_e_e": return ["assets/image/centipede.png", "assets/image/concrete.png"];
    //[イァ]:4
      case "eer": return ["assets/image/deer.png", "assets/image/beer.png"]; //1
      case "ear": return ["assets/image/ear.png", "assets/image/gear.png"]; //1
    //[ウー]:2
      case "ue": return ["assets/image/blueberry.png", "assets/image/tissue.png"];
      case "ui": return ["assets/image/passionfruit.png", "assets/image/suit.png"]; //
      case "ew": return ["assets/image/stew.png", "assets/image/newspaper.png"]; //1
      case "ōō": return ["assets/image/badtooth.png", "assets/image/kangaroo.png"];
      case "ōū": return ["assets/image/soup.png", "assets/image/rouge.png"];
      case "_u_e": return ["assets/image/perfume.png", "assets/image/sugarcube.png"];
    //[ウッ]
      case "oo": return ["assets/image/good.png", "assets/image/bookstore.png"];
    //[エィ]:1
      case "ai": return ["assets/image/train.png", "assets/image/snail.png"];
      case "ay": return ["assets/image/okay.png", "assets/image/mantaray.png"]; //1
      case "_a_e": return ["assets/image/cake.png", "assets/image/snake.png"];
    //[エァ]
      case "air": return ["assets/image/airplane.png", "assets/image/hairdryer.png"];
    //[エ]:1
      case "ea": return ["assets/image/bread.png", "assets/image/feather.png"];
    //[オー]:4
      case "au": return ["assets/image/santaclaus.png", "assets/image/sausage.png"]; //1
      case "aw": return ["assets/image/strawberry.png", "assets/image/seesaw.png"]; //1
      case "our": return ["assets/image/court.png", "assets/image/four.png"]; //1
    //[オィ]
      case "oy": return ["assets/image/boy.png", "assets/image/soybeans.png"];
    //[オゥ]:2
      case "oa": return ["assets/image/goat.png", "assets/image/toast.png"];
      case "ōw": return ["assets/image/snowman.png", "assets/image/owl.png"];
      case "_o_e": return ["assets/image/rose.png", "assets/image/tadpole.png"];
    //[オーゥ]:2
      case "all": return ["assets/image/ball.png", "assets/image/mall.png"]; //1
    //[フ]:
      case "ph": return ["assets/image/dolphin.png", "assets/image/smartphone.png"];
    //[チュッ]:
      case "ch": return ["assets/image/chocolate.png", "assets/image/chicken.png"];
    //[シュ]:
      case "sh": return ["assets/image/mushroom.png", "assets/image/shark.png"];
    //[ス]:
      case "th": return ["assets/image/thunder.png", "assets/image/three.png"];
    //[ズ]:
      case "th'": return ["assets/image/mother.png", "assets/image/rhythm.png"];
    //[ハウッ]
      case "wh": return ["assets/image/whale.png", "assets/image/ferriswheel.png"];
    //[クッ]
      case "ck": return ["assets/image/duck.png", "assets/image/clock.png"];
    //[ングゥ]
      case "ng": return ["assets/image/pudding.png", "assets/image/fryingpan.png"];
    //[リィ]:4
      case "lly": return ["assets/image/jelly.png", "assets/image/belly.png"]; //2
      default: return AlphabetClass().alphabetPicture(word);
    }
  }
}