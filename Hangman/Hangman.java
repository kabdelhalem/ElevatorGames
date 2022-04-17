public class Hangman{
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
            for (int i=0; i<choice;i++){

                
                char chara = secretword.charAt(i);
                Word letter = new Word(i, chara);
                secword[i]  = letter;
                seccharacteramounts[chara] = seccharacteramounts[chara] + 1;

            }

            StdOut.println();
            StdOut.print("The word has been chosen! Good Luck!");
            int print = 0;
            StdOut.println();
            while (print!=choice){
                StdOut.print("_ ");
                print++;
            }
            StdOut.println();
            StdOut.print("Enter a letter => ");
            String word = StdIn.readLine();

            Word[]inputword = new Word[1];
            for (int i=0; i<1;i++){
                
                char chara = word.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
                inputcharacteramouts[chara] = inputcharacteramouts[chara] + 1;
            }
            
            String result = "";
            String wordsused = "";

            int errors = 0;
            recursivecompare(inputword, secword, result, seccharacteramounts, inputcharacteramouts, errors, wordsused);



            
        }
    }
    
    private static void recursivecompare(Word[] inputword, Word[] secretword, String result,  int[]seccharacteramounts, int[]inputcharacteramouts, int errors, String wordsused) {

        if (errors==8){
            result ="";
            for (int i=0; i<secretword.length;i++){
                result = result + secretword[i].getCharacter();
            }
            StdOut.println("Better luck next time! The word was: " + result);
            return;
            
        } 
        int count =0;

        for (int i=0; i<secretword.length;i++){
            if (inputword[0].getCharacter()==secretword[i].getCharacter()){
                result = result + secretword[i].getCharacter();
                seccharacteramounts[secretword[i].getCharacter()] = 0;
                count++;
            } else if (inputword[0].getCharacter()!=secretword[i].getCharacter()&&seccharacteramounts[secretword[i].getCharacter()]==0   ) {
                result = result+ secretword[i].getCharacter();

            } else {
                result = result + " _";
                
            }

        }

        if (count==0){
            errors++;
            wordsused = inputword[0].getCharacter() + ", "+ wordsused ;
        } 
        String correctchecker = "";
        for (int i=0; i<secretword.length;i++){
            correctchecker = correctchecker + secretword[i].getCharacter();
        }

        if (result.equals(correctchecker)){
            StdOut.println();
            StdOut.println("The word was: " + correctchecker);
            StdOut.println("Congratulations! You guessed the word with " + errors + " error(s)!");
            return;
        }






        
       
        
            StdOut.println();
            StdOut.println("You currently have done " + errors + " error(s)");
            StdOut.println("The following letters are wrong: " + wordsused);
            StdOut.println("Try again: ");
            StdOut.println(result);
            StdOut.print("Enter a word => ");
            
            String choice = StdIn.readLine();
            for (int j=0; j<choice.length();j++){
                
                char chara = choice.charAt(j);
                Word letter = new Word(j, chara );
                inputword[j]  = letter;
            }
        
       
        result = "";
        recursivecompare(inputword, secretword, result,  seccharacteramounts, inputcharacteramouts, errors, wordsused);
        

    }
    

}