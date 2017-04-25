//
//  Game8037.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Game8037.h"
#import "Randomizer.h"

const NSString *StartGreeting = @"Hello, let's play. Current difficulty level is %@\n";
const NSString *BaseGreeting = @"%i %i %i %i";
const NSString *TaskMessage = @"The next task is %@\n(enter \"%@\" for exit)";
const NSString *CorrectMessage = @"Absolutely right.\n";
const NSString *WrongMessage = @"Sorry, you made a mistake. Try again.\n";

typedef enum {
    LevelEasy,
    LevelNormal,
    LevelHard1,
    LevelHard2
} Level;

@interface Game8037()

@property (assign, nonatomic) Level level;
@property (assign, nonatomic) NSInteger result;

@end

@implementation Game8037

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.level = LevelNormal;
        self.result = 0;
        NSLog(StartGreeting, [self descriptionOfLevel:self.level]);
    }
    return self;
}

- (NSInteger)resultWithLevel:(Level)level andRandomizer:(Randomizer *)randomizer {
    NSInteger result = 0;
    
    switch (level) {
        case LevelEasy:
            result = randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber;
            break;
        case LevelNormal:
            result = randomizer.firstNumber*10 + randomizer.secondNumber + randomizer.thirdNumber*10 + randomizer.fourthNumber;
            break;
        case LevelHard1:
            result = randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber;
            break;
        case LevelHard2:
            result = (randomizer.firstNumber*10 + randomizer.secondNumber) * (randomizer.thirdNumber*10 + randomizer.fourthNumber);
            break;
    }
    
    return result;
}

- (NSString *)descriptionOfLevel:(Level)level {
    NSString *result = @"";
    
    switch (level) {
        case LevelEasy:
            result = @"easy";
            break;
        case LevelNormal:
            result = @"normal";
            break;
        case LevelHard1:
            result = @"hard1";
            break;
        case LevelHard2:
            result = @"hard2";
            break;
    }
    
    return result;
}

#pragma mark - Game

- (void)greetWithExitWord:(NSString *)exitWord {
    Randomizer *randomizer = [[Randomizer alloc] init];
    self.result = [self resultWithLevel:self.level andRandomizer:randomizer];
    NSString *task = [NSString stringWithFormat:BaseGreeting,
                      randomizer.firstNumber,
                      randomizer.secondNumber,
                      randomizer.thirdNumber,
                      randomizer.fourthNumber];
    
    NSLog(TaskMessage, task, exitWord);
}

- (void)checkUserAnswer:(NSString *)userAnswer {
    if (self.result == [userAnswer integerValue]) {
        NSLog(@"%@", CorrectMessage);
    } else {
        NSLog(@"%@", WrongMessage);
    }
}

@end
