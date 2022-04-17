import 'dart:math';


getRandom(choice){
  List<String> directory = ["eel","cat","dog","the","bow", "cow", "die", "cup", "sip","fan", /*"tube", "live", "give"
        , "soda", "code", "note", "love", "card", "fart", "lamp", "water", "cubit", "whale", "cards", "mouse", "sheet", "sheep", "smell","steal","sneak"*/];

  // directory.where((f) => f.length(choice)).toList();

  // final random = new Random();
  // var element = directory[random.nextInt(directory.length)];
  
  // if(element.length != choice){
  //   return getRandom(choice);
  // }else{
  //   return element;
  // }
  
  return directory;
  
}


wordleGame(choice, inputword, tries){
  
  List<String> directory = getRandom(choice);
  
  String secretWord = directory[0];
  print(secretWord);
  String result = '';
  if(tries == 0){
    for(int i = 0; i<secretWord.length; i++){
      result = secretWord[i];
      
    }
  }
  
  for(int i = 0; i<inputword.length; i++){
    if(inputword[i] == secretWord[i]){
      
    }
  }
  
  return result;
  
  
  
  
  
  
}
  
