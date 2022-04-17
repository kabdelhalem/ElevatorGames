import 'package:elevatorgames/pages/wordleGame/wordlemain.dart';

chooseDifficulty(difficulty){
  if(difficulty == "Three Letters"){
    return 3;
  }else if(difficulty == "Four Letters"){
    return 4;
  }else{
    return 5;
  }
}