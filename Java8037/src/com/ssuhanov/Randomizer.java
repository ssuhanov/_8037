package com.ssuhanov;

import java.util.Random;

/**
 * Created by ssuhanov on 4/22/17.
 */
public class Randomizer {

    private static Random random = new Random();

    int firstNumber;
    int secondNumber;
    int thirdNumber;
    int fourthNumber;

    public Randomizer() {
        firstNumber = random.nextInt(9) + 1;
        secondNumber = random.nextInt(10);
        thirdNumber = random.nextInt(10);
        fourthNumber = random.nextInt(10);
    }

}
