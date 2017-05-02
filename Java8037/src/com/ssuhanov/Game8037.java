package com.ssuhanov;

import org.jetbrains.annotations.Nullable;

/**
 * Created by ssuhanov on 4/23/17.
 */
public class Game8037 implements Game {

    private static final String EasyLevelNumber = "1";
    private static final String NormalLevelNumber = "2";
    private static final String Hard1LevelNumber = "3";
    private static final String Hard2LevelNumber = "4";

    private static final String EasyLevelName = "easy";
    private static final String NormalLevelName = "normal";
    private static final String Hard1LevelName = "hard1";
    private static final String Hard2LevelName = "hard2";

    private static final String StartGreeting = "Hello, let's play. Please select difficulty level:%s";
    private static final String LevelForSelect = "\n%s - %s";
    private static final String BaseGreeting = "%s %s %s %s";
    private static final String TaskMessage = "The next task is %s\n(enter \"%s\" for exit)";
    private static final String CorrectMessage = "Absolutely right.\n";
    private static final String WrongMessage = "Sorry, you made a mistake. Try again.\n";
    private static final String ErrorLevelMessage = "Sorry, you have selected wrong level. Good bye.\n";

    private enum Level {
        Easy {
            public String toString() {
                return EasyLevelName;
            }
        },
        Normal {
            public String toString() {
                return NormalLevelName;
            }
        },
        Hard1 {
            public String toString() {
                return Hard1LevelName;
            }
        },
        Hard2 {
            public String toString() {
                return Hard2LevelName;
            }
        }
    }

    private Level level;
    private int result;

    private Game8037(Level level) {
        this.level = level;
        this.result = 0;
    }

    @Nullable
    public static Game8037 Create() {
        String levels = String.format("%s%s%s%s", levelForSelect(Level.Easy), levelForSelect(Level.Normal), levelForSelect(Level.Hard1), levelForSelect(Level.Hard2));
        System.out.println(String.format(StartGreeting, levels));

        Game8037 game8037;

        String selectedLevel = readLine();
        switch (selectedLevel) {
            case EasyLevelNumber:
            case EasyLevelName:
                game8037 = new Game8037(Level.Easy);
                break;
            case NormalLevelNumber:
            case NormalLevelName:
                game8037 = new Game8037(Level.Normal);
                break;
            case Hard1LevelNumber:
            case Hard1LevelName:
                game8037 = new Game8037(Level.Hard1);
                break;
            case Hard2LevelNumber:
            case Hard2LevelName:
                game8037 = new Game8037(Level.Hard2);
                break;
            default:
                game8037 = null;
                System.out.println(ErrorLevelMessage);
                break;
        }

        return game8037;
    }

    private static String levelForSelect(Level level) {
        String levelNumber = "";
        String levelName = "";

        switch (level) {
            case Easy:
                levelNumber = EasyLevelNumber;
                levelName = EasyLevelName;
                break;
            case Normal:
                levelNumber = NormalLevelNumber;
                levelName = NormalLevelName;
                break;
            case Hard1:
                levelNumber = Hard1LevelNumber;
                levelName = Hard1LevelName;
                break;
            case Hard2:
                levelNumber = Hard2LevelNumber;
                levelName = Hard2LevelName;
                break;
        }

        return String.format(LevelForSelect, levelNumber, levelName);
    }

    private int resultWithLevelAndRandomizer(Level level, Randomizer randomizer) {
        int result = 0;

        switch (level) {
            case Easy:
                result = randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber;
                break;
            case Normal:
                result = randomizer.firstNumber*10 + randomizer.secondNumber + randomizer.thirdNumber*10 + randomizer.fourthNumber;
                break;
            case Hard1:
                result = randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber;
                break;
            case Hard2:
                result = (randomizer.firstNumber*10 + randomizer.secondNumber) * (randomizer.thirdNumber*10 + randomizer.fourthNumber);
                break;
        }

        return result;
    }

    static private String readLine() {
        java.util.Scanner scanner = new java.util.Scanner(System.in);
        return scanner.next();
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
