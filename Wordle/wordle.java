public class wordle{
    public static void main (String[]args){
        String[] directory = {"eel","cat","dog","the","bow", "cow", "die", "cup", "sip","fan", "tube", "live", "give"
        , "soda", "code", "note", "love", "card", "fart", "lamp", "water", "cubit", "whale", "cards", "mouse", "sheet", "sheep", "smell","steal","sneak"};

        
        
        


        int[] seccharacteramounts = new int[128];
        int[] inputcharacteramouts = new int[128];



        StdOut.print("Choose your difficulty:");
        StdOut.println();
        StdOut.println("Easy mode: 3 letters");
        StdOut.println("Normal mode: 4 letters");
        StdOut.println("Hard mode: 5 letters");



        StdOut.print("Enter a number => ");
        int choice = Integer.parseInt(StdIn.readLine());

        int arraysize = 0;
        int startpoint =0;

        for (int i = 0; i<directory.length;i++){
            if (choice == directory[i].length()){
                arraysize++;
                
            }
            if(choice>directory[i].length()){
                startpoint++;
            }
        }




        String[]wordsizearray= new String[arraysize];
        
        int shifter = 0;
        for (int i = 0; i<wordsizearray.length;i++){
            for (int j=startpoint; j<directory.length;j++)
             if (choice == directory[j].length()){
                 
                 
                wordsizearray[i] = directory[j+shifter];
                shifter++;
                break;
            }
            
        }

        if (choice>6){
            StdOut.print("Please, choose between 3-6 letters.");
        } else{

       
            int selection = (int) Math.floor(Math.random()*10);
            String secretword = wordsizearray[selection];
        
            
            Word[] secword = new Word[choice];
            int tries =choice;
            for (int i=0; i<choice;i++){

                
                char chara = secretword.charAt(i);
                Word letter = new Word(i, chara);
                secword[i]  = letter;
                seccharacteramounts[chara] = seccharacteramounts[chara] + 1;

            }

            StdOut.println();
            StdOut.print("The word has been chosen! You will have " + tries + " tries to guess it! Begin!");
            int print = 0;
            StdOut.println();
            while (print!=choice){
                StdOut.print("_ ");
                print++;
            }
            StdOut.println();
            StdOut.print("Enter a word => ");
            String word = StdIn.readLine();

            Word[]inputword = new Word[choice];
            for (int i=0; i<choice;i++){
                
                char chara = word.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
                inputcharacteramouts[chara] = inputcharacteramouts[chara] + 1;
            }
            
            String result = "";
            recursivecompare(inputword, secword, result, tries-1, seccharacteramounts, inputcharacteramouts);


            
        }
    }
    
    private static void recursivecompare(Word[] inputword, Word[] secretword, String result, int tries, int[]seccharacteramounts, int[]inputcharacteramouts) {

        if (tries==0){
            for (int i=0; i<secretword.length;i++){
                result = result + secretword[i].getCharacter();
            }
            StdOut.println("Better luck next time! The word was: " + result);
            return;
            
        }
        
        int count = 0;
        for (int i=0; i<inputword.length;i++){    
            if (inputword[i].getCharacter()==secretword[i].getCharacter()&&(inputword[i].getLocation()==secretword[i].getLocation())){
                result = result + inputword[i].getCharacter();
                count++;

                inputcharacteramouts[inputword[i].getCharacter()] = inputcharacteramouts[inputword[i].getCharacter()] -1;
                StdOut.println("The letter " + inputword[i].getCharacter() + " is in the right place.");

                
            } else{
            int iterator = 0;    
                for (int j=0; j<inputword.length;j++){
                    if (inputword[i].getCharacter()==secretword[j].getCharacter()&&i!=j){

                        if (inputcharacteramouts[inputword[i].getCharacter()]>seccharacteramounts[secretword[j].getCharacter()]&&inputword.length!=3) {
                            StdOut.println("There's only " + seccharacteramounts[secretword[j].getCharacter()] +" letter(s) of the type " + inputword[i].getCharacter());
                            inputcharacteramouts[inputword[i].getCharacter()] = 30;
                            iterator = 0;
                            result = result + "_ ";
                            break;
                        } else {
                            result = result + "? ";
                        StdOut.println("The letter " + inputword[i].getCharacter() + " is in the wrong spot. ");
                        iterator =0;
                        break;
                        }

                        
                    } 
                    iterator++;

                }
                if (iterator>0){
                    result = result + "_ ";
                    StdOut.println("The letter " + inputword[i].getCharacter() + " is not in this word. ");
                }  
            }
        }
        if (count == secretword.length){
            StdOut.println("You got it right, congratulations!");
            return;
        } else {
            StdOut.println();
            StdOut.println("You have " + (tries) + " try/tries left");
            StdOut.println("Try again: ");
            StdOut.println(result);
            StdOut.print("Enter a word => ");
            
            String choice = StdIn.readLine();
            for (int i=0; i<choice.length();i++){
                
                char chara = choice.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
            }
        }
       
        result = "";
        recursivecompare(inputword, secretword, result, tries-1, seccharacteramounts, inputcharacteramouts);
        

    }
    

}