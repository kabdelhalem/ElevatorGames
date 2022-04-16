public class wordle{
    public static void main (String[]args){
        String[] threeletters = {"eel","cat","dog","the","bow", "cow", "die", "cup", "sip","fan"};
        String[] fourletters = {"tube", "live", "give", "soda", "code", "note", "love", "card", "fart", "lamp"};
        String [] fiveletters = {"water", "cubit", "whale", "cards", "mouse", "sheet", "sheep", "smell","steal","sneak"};


        /* CHANGES TO BE MADE:
        * - CREATE A BIG ARRAY OF STRINGS ANY SIZE, USER MAKES CHOICE, CHOICE REGISTERS SIZE OF EVERY STRING. ITERATE THROUGH BIG ARRAY AND STORE
        * INTO SMALL ARRAY ALL THE CHOICE-SIZED STRINGS.
        * - DIFFICULTY: DIFFICULTY CAN BE GIVEN IN THE "SELECTION MENU", JUST CHANGE THE WORDING E.G. "HARD MODE: 5-6 WORDS".
        * KEEP AN OUT OF BOUNDS CASE.
        * - DOUBLE LETTERS: MODIFY WORD.JAVA AND ADD 1 MORE VARIABLE [REQUIRES A LOT OF FIXING]:
        *    + What if dodo has 2 d's and the word is word and it has 1 d. How to fix *question mark*. Potential solution. If 1 of them is in the slot, mark the other as wrong
        *      or smth.
        *
        */




        StdOut.print("How long do you want the word to be?");
        StdOut.println();
        for (int i = 0; i< 3; i++) {
            
            StdOut.println("I want it to be " + (i+3) + " words long");
        }




        StdOut.print("Enter a number => ");
        int choice = Integer.parseInt(StdIn.readLine());

        if (choice == 3){
            int selection = (int) Math.floor(Math.random()*10);
            String secretword = threeletters[selection];
            Word[] secword = new Word[3];
            int tries =3;
            for (int i=0; i<choice;i++){
                
                char chara = secretword.charAt(i);
                Word letter = new Word(i, chara );
                secword[i]  = letter;
            }

            StdOut.println();
            StdOut.print("The word has been chosen! You will have " + tries + " tries to guess it! Begin!");
            int print = 0;
            StdOut.println();
            while (print!=3){
                StdOut.print("_ ");
                print++;
            }
            StdOut.println();
            StdOut.print("Enter a word => ");
            String word = StdIn.readLine();

            Word[]inputword = new Word[3];
            for (int i=0; i<choice;i++){
                
                char chara = word.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
            }
            String result = "";
            recursivecompare(inputword, secword, result, tries);


            
        } else if (choice ==4){
            int selection = (int) Math.floor(Math.random()*10);
            String secretword = fourletters[selection];
            Word[] secword = new Word[4];
            int tries = 4;

            StdOut.println();
            StdOut.print("The word has been chosen! You will have " + tries + " tries to guess it! Begin!");
            int print = 0;
            StdOut.println();
            while (print!=4){
                StdOut.print("_ ");
                print++;
            }
            StdOut.println();
            StdOut.print("Enter a word => ");
            String word = StdIn.readLine();

            Word[]inputword = new Word[4];
            for (int i=0; i<choice;i++){
                
                char chara = word.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
            }
            String result = "";
            for (int i=0; i<choice;i++){
                
                char chara = secretword.charAt(i);
                Word letter = new Word(i, chara );
                secword[i]  = letter;
            }
            recursivecompare(inputword, secword, result, tries);
            
        } else if (choice ==5) {
            int selection = (int) Math.floor(Math.random()*10);
            String secretword = fiveletters[selection];
            Word[] secword = new Word[5];
            int tries = 5;

            StdOut.println();
            StdOut.print("The word has been chosen! You will have " + tries + " tries to guess it! Begin!");
            int print = 0;
            StdOut.println();
            while (print!=5){
                StdOut.print("_ ");
                print++;
            }
            StdOut.println();
            StdOut.print("Enter a word => ");
            String word = StdIn.readLine();

            Word[]inputword = new Word[5];
            for (int i=0; i<choice;i++){
                
                char chara = word.charAt(i);
                Word letter = new Word(i, chara );
                inputword[i]  = letter;
            }
            String result = "";
            for (int i=0; i<choice;i++){
                
                char chara = secretword.charAt(i);
                Word letter = new Word(i, chara );
                secword[i]  = letter;
            }
            recursivecompare(inputword, secword, result, tries);
            
        } else {
            System.out.println("Only 3,4 or 5, please.");
        }
    }
    private static void recursivecompare(Word[] inputword, Word[] secretword, String result, int tries) {

        if (tries==0){
            for (int i=0; i<secretword.length;i++){
                result = result + secretword[i];
            }
            StdOut.println("Better luck next time! The word was: " + result);
            return;
            
        }
        int count = 0;
        for (int i=0; i<inputword.length;i++){    
            if (inputword[i].getCharacter()==secretword[i].getCharacter()&&(inputword[i].getLocation()==secretword[i].getLocation())){
                result = result + inputword[i].getCharacter();
                count++;
                StdOut.println("The letter " + inputword[i].getCharacter() + " is in the right place.");
                
            } else{
            int iterator = 0;    
                for (int j=0; j<inputword.length;j++){
                    if (inputword[i].getCharacter()==secretword[j].getCharacter()&&i!=j){
                        result = result + "? ";
                        StdOut.println("The letter " + inputword[i].getCharacter() + " is in the wrong spot. ");
                        iterator =0;
                        break;
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
        recursivecompare(inputword, secretword, result, tries-1);
        

    }
    

}