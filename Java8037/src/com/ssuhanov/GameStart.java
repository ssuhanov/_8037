package com.ssuhanov;

/**
 * Created by ssuhanov on 4/15/17.
 */
public class GameStart {

    private static final String GreetingMessage = "Please enter your answer (enter \"%s\" for exit):";
    private static final String InputAcceptMessage = "You entered \"%s\".\n";
    private static final String GoodByeMessage = "Good bye.\n";
    
    private String exitWord;

    public GameStart(String exitWord) {
        this.exitWord = exitWord;
    }

    void startGame() {
        System.out.println(String.format(GreetingMessage, exitWord));
        String inputWord = readLine();

        checkInputWord(inputWord);
    }

    private void checkInputWord(String inputWord) {
        if (inputWord.equals(exitWord)) {
            System.out.println(GoodByeMessage);
        } else {
            System.out.println(String.format(InputAcceptMessage, inputWord));
            startGame();
        }
    }

    private String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
    }

}
