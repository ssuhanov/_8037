package com.ssuhanov;

/**
 * Created by ssuhanov on 4/15/17.
 */
public class GameStart {

    private static final String GoodByeMessage = "Good bye.\n";
    
    private String exitWord;
    private Game game;

    public GameStart(String exitWord) {
        this.exitWord = exitWord;
        this.game = Game8037.Create();
    }

    void startGame() {
        if (game != null) {
            String inputWord;

            do {
                game.greet(exitWord);
                inputWord = readLine();
            } while (checkInputWord(inputWord));
        }
    }

    private boolean checkInputWord(String inputWord) {
        boolean isExitWord = inputWord.equals(exitWord);
        if (isExitWord) {
            System.out.println(GoodByeMessage);
        } else {
            game.checkUserAnswer(inputWord);
        }
        return !isExitWord;
    }

    private String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
    }

}
