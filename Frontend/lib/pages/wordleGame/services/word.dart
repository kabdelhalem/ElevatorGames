class Word{
  int ?position;
  String ?character;
  
  Word({required this.position, required this.character});
  
  getLocation(){
    return position;
  }
  setLocation(){
    position = 1;
  }

  getCharacter(){
    return character;
  }
  setCharacter(String chara){
    character = chara;
  }

}
  

  