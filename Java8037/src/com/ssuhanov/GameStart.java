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
        String inputWord;

        do {
            System.out.println(String.format(GreetingMessage, exitWord));
            inputWord = readLine();
        } while (checkInputWord(inputWord));
    }

    private boolean checkInputWord(String inputWord) {
        boolean isExitWord = inputWord.equals(exitWord);
        System.out.println(isExitWord ? GoodByeMessage : String.format(InputAcceptMessage, inputWord));
        return !isExitWord;
    }

    private String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
    }

}
