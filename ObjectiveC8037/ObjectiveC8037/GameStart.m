//
//  GameStart.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "GameStart.h"

NSString *GreetingMessage = @"Please enter your answer (enter \"%@\" for exit):";
NSString *InputAcceptMessage = @"You entered \"%@\".\n";
NSString *GoodByeMessage = @"Good bye.\n";
NSString *ErrorMessage = @"There is unknown error, sorry. Good bye.\n";

@interface GameStart()

@property (strong, nonatomic) NSString *exitWord;

@end

@implementation GameStart

- (instancetype)initWithExitWord:(NSString *)exitWord {
    self = [super init];
    if (self) {
        self.exitWord = exitWord;
    }
    return self;
}

- (void)startGame {
    NSLog(GreetingMessage, self.exitWord);
    NSString *inputWord = [self readLine];
    
    if (inputWord) {
        [self checkInputWord:inputWord];
    } else {
        NSLog(@"%@", ErrorMessage);
    }
}

- (void)checkInputWord:(NSString *)inputWord {
    if ([inputWord isEqualToString:self.exitWord]) {
        NSLog(@"%@", GoodByeMessage);
    } else {
        NSLog(InputAcceptMessage, inputWord);
        [self startGame];
    }
}

- (NSString *)readLine {
    char inputValue;
    scanf("%s", &inputValue);
    return [NSString stringWithUTF8String:&inputValue];
}

@end
