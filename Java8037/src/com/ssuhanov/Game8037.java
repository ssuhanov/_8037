package com.ssuhanov;

/**
 * Created by ssuhanov on 4/23/17.
 */
public class Game8037 implements Game {

    private static final String StartGreeting = "Hello, let's play. Current difficulty level is %s\n";
    private static final String BaseGreeting = "%s %s %s %s";
    private static final String TaskMessage = "The next task is %s\n(enter \"%s\" for exit)";
    private static final String CorrectMessage = "Absolutely right.\n";
    private static final String WrongMessage = "Sorry, you made a mistake. Try again.\n";

    private enum Level {
        Easy {
            public String toString() {
                return "easy";
            }
        },
        Normal {
            public String toString() {
                return "normal";
            }
        },
        Hard1 {
            public String toString() {
                return "hard1";
            }
        },
        Hard2 {
            public String toString() {
                return "hard2";
            }
        }
    }

    private Level level;
    private int result;

    public Game8037() {
        this.level = Level.Normal;
        this.result = 0;
        System.out.println(String.format(StartGreeting, this.level.toString()));
    }

    private int resultWithLevelAndRandomizer(Level level, Randomizer randomizer) {
        switch (level) {
            case Easy:
                return randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber;
            case Normal:
                return randomizer.firstNumber*10 + randomizer.secondNumber + randomizer.thirdNumber*10 + randomizer.fourthNumber;
            case Hard1:
                return randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber;
            case Hard2:
                return (randomizer.firstNumber*10 + randomizer.secondNumber) * (randomizer.thirdNumber*10 + randomizer.fourthNumber);
            default:
                return 0;
        }
    }

    @Override
    public void greet(String exitWord) {
        Randomizer randomizer = new Randomizer();
        result = resultWithLevelAndRandomizer(level, randomizer);

        String task = String.format(BaseGreeting, randomizer.firstNumber, randomizer.secondNumber, randomizer.thirdNumber, randomizer.fourthNumber);
        System.out.println(String.format(TaskMessage, task, exitWord));
    }

    @Override
    public void checkUserAnswer(String userAnswer) {
        int answer;

        try {
            answer = Integer.parseInt(userAnswer);
        } catch (Exception e) {
            System.out.println(WrongMessage);
            return;
        }

        if (result == answer) {
            System.out.println(CorrectMessage);
        } else {
            System.out.println(WrongMessage);
        }
    }
}
