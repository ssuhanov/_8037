package com.ssuhanov;

/**
 * Created by ssuhanov on 4/15/17.
 */
public class GameStart {

    static final String GreetingMessage = "Please enter your answer (enter \"%s\" for exit):";
    static final String InputAcceptMessage = "You entered \"%s\".\n";
    static final String GoodByeMessage = "Good bye.\n";
    
    String exitWord;

    public GameStart(String exitWord) {
        this.exitWord = exitWord;
    }

    public void startGame() {
        System.out.println(String.format(GreetingMessage, exitWord));
        String inputWord = readLine();

        checkInputWord(inputWord);
    }

    void checkInputWord(String inputWord) {
        if (inputWord.equals(exitWord)) {
            System.out.println(GoodByeMessage);
        } else {
            System.out.println(String.format(InputAcceptMessage, inputWord));
            startGame();
        }
    }

    String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
    }

}
