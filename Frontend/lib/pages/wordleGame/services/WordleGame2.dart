

import 'package:elevatorgames/pages/wordleGame/services/word.dart';
WordleGame2(choice, input, tries)
{
    List<String> directory = ["eel", "cat", "dog", "the", "bow", "cow", "die", "cup", "sip", "fan", "tube", "live", "give", "soda", "code", "note", "love", "card", "fart", "lamp", "water", "cubit", "whale", "cards", "mouse", "sheet", "sheep", "smell", "steal", "sneak"];
    List<int> seccharacteramounts = new List<int>(128);
    List<int> inputcharacteramouts = new List<int>(128);
    int arraysize = 0;
    int startpoint = 0;
    for (int i = 0; i < directory.length; i++) {
        if (choice == directory[i].length) {
            arraysize++;
        }
        if (choice > directory[i].length) {
            startpoint++;
        }
    }
    List<String> wordsizearray = new List<String>(arraysize);
    int shifter = 0;
    for (int i = 0; i < wordsizearray.length; i++) {
        for (int j = startpoint; j < directory.length; j++) {
            if (choice == directory[j].length) {
                wordsizearray[i] = directory[j + shifter];
                shifter++;
                break;
            }
        }
    }
        List<String> inputword = input;
        
        String result = "";
        recursivecompare(inputword, secWord, result, tries - 1, seccharacteramounts, inputcharacteramouts);
    }
}

recursivecompare(List<String> inputword, List<String> secretword, String result, int tries, List<int> seccharacteramounts, List<int> inputcharacteramouts)
{
    if (tries == 0) {
        for (int i = 0; i < secretword.length; i++) {
            result = (result + secretword[i]);
        }
        return "Better luck next time! The word was:  ${result}";
    }
    int count = 0;
    for (int i = 0; i < inputword.length; i++) {
        if ((inputword[i] == secretword[i]) && ((inputword[i].getLocation()) == getLocation(secretword[i]))) {
            result = (result + inputword[i]);
            count++;
            inputcharacteramouts[inputword[i].getCharacter()] = (inputcharacteramouts[inputword[i].getCharacter()] - 1);
            StdOut.println(("The letter " + inputword[i].getCharacter()) + " is in the right place.");
        } else {
            int iterator = 0;
            for (int j = 0; j < inputword.length; j++) {
                if ((inputword[i].getCharacter() == secretword[j].getCharacter()) && (i != j)) {
                    if ((inputcharacteramouts[inputword[i].getCharacter()] > seccharacteramounts[secretword[j].getCharacter()]) && (inputword.length != 3)) {
                        StdOut.println((("There's only " + seccharacteramounts[secretword[j].getCharacter()]) + " letter(s) of the type ") + inputword[i].getCharacter());
                        inputcharacteramouts[inputword[i].getCharacter()] = 30;
                        iterator = 0;
                        result = (result + "_ ");
                        break;
                    } else {
                        result = (result + "? ");
                        StdOut.println(("The letter " + inputword[i].getCharacter()) + " is in the wrong spot. ");
                        iterator = 0;
                        break;
                    }
                }
                iterator++;
            }
            if (iterator > 0) {
                result = (result + "_ ");
                StdOut.println(("The letter " + inputword[i].getCharacter()) + " is not in this word. ");
            }
        }
    }
    if (count == secretword.length) {
        StdOut.println("You got it right, congratulations!");
        return;
    } else {
        StdOut.println(); 
        StdOut.println("You have " + (+" try/tries left"));
        StdOut.println("Try again: ");
        StdOut.println(result);
        StdOut.print("Enter a word => ");
        String choice = StdIn.readLine();
        for (int i = 0; i < choice.length; i++) {
            int chara = choice.codeUnitAt(i);
            Word letter = new Word(i, chara);
            inputword[i] = letter;
        }
    }
    result = "";
    recursivecompare(inputword, secretword, result, tries - 1, seccharacteramounts, inputcharacteramouts);
}


