//
//  Game8037.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Game8037.h"
#import "Randomizer.h"

const NSString *EasyLevelNumber = @"1";
const NSString *NormalLevelNumber = @"2";
const NSString *Hard1LevelNumber = @"3";
const NSString *Hard2LevelNumber = @"4";

const NSString *EasyLevelName = @"easy";
const NSString *NormalLevelName = @"normal";
const NSString *Hard1LevelName = @"hard1";
const NSString *Hard2LevelName = @"hard2";

const NSString *StartGreeting = @"Hello, let's play. Please select difficulty level:%@";
const NSString *LevelForSelect = @"\n%@ - %@";
const NSString *BaseGreeting = @"%i %i %i %i";
const NSString *TaskMessage = @"The next task is %@\n(enter \"%@\" for exit)";
const NSString *CorrectMessage = @"Absolutely right.\n";
const NSString *WrongMessage = @"Sorry, you made a mistake. Try again.\n";
const NSString *ErrorLevelMessage = @"Sorry, you have selected wrong level. Good bye.\n";

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
        self.result = 0;
        NSString *levels = [NSString stringWithFormat:@"%@%@%@%@",
                            [self levelForSelect:LevelEasy],
                            [self levelForSelect:LevelNormal],
                            [self levelForSelect:LevelHard1],
                            [self levelForSelect:LevelHard2]];
        
        NSLog(StartGreeting, levels);
        NSString *selectedLevel = [self readLine];
        if ([selectedLevel isEqualToString:EasyLevelNumber] || [selectedLevel isEqualToString:EasyLevelName]) {
            self.level = LevelEasy;
        } else if ([selectedLevel isEqualToString:NormalLevelNumber] || [selectedLevel isEqualToString:NormalLevelName]) {
            self.level = LevelNormal;
        } else if ([selectedLevel isEqualToString:Hard1LevelNumber] || [selectedLevel isEqualToString:Hard1LevelName]) {
            self.level = LevelNormal;
        } else if ([selectedLevel isEqualToString:Hard2LevelNumber] || [selectedLevel isEqualToString:Hard2LevelName]) {
            self.level = LevelNormal;
        } else {
            NSLog(@"%@", ErrorLevelMessage);
            return nil;
        }
    }
    return self;
}

- (NSString *)levelForSelect:(Level)level {
    NSString *levelNumber;
    NSString *levelName;
    
    switch (level) {
        case LevelEasy:
            levelNumber = EasyLevelNumber;
            levelName = EasyLevelName;
            break;
        case LevelNormal:
            levelNumber = NormalLevelNumber;
            levelName = NormalLevelName;
            break;
        case LevelHard1:
            levelNumber = Hard1LevelNumber;
            levelName = Hard1LevelName;
            break;
        case LevelHard2:
            levelNumber = Hard2LevelNumber;
            levelName = Hard2LevelName;
            break;
    }
    
    return [NSString stringWithFormat:LevelForSelect, levelNumber, levelName];
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

- (NSString *)readLine {
    char inputValue;
    scanf("%s", &inputValue);
    return [NSString stringWithUTF8String:&inputValue];
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
