package com.ssuhanov;

/**
 * Created by ssuhanov on 4/15/17.
 */
public class GameStart {

    static String GreetingMessage = "Please enter your answer (enter \"%s\" for exit):";
    static String InputAcceptMessage = "You entered \"%s\".\n";
    static String GoodByeMessage = "Good bye.\n";
    
    String exitWord;

    public GameStart(String exitWord) {
        this.exitWord = exitWord;
    }

    public void startGame() {
        System.out.println(String.format(GameStart.GreetingMessage, this.exitWord));
        String inputWord = readLine();

        checkInputWord(inputWord);
    }

    void checkInputWord(String inputWord) {
        if (inputWord.equals(this.exitWord)) {
            System.out.println(GameStart.GoodByeMessage);
        } else {
            System.out.println(String.format(GameStart.InputAcceptMessage, inputWord));
            this.startGame();
        }
    }

    String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
    }

}
