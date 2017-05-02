//
//  GameStart.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "GameStart.h"
#import "Game8037.h"

const NSString *GreetingMessage = @"Please enter your answer (enter \"%@\" for exit):";
const NSString *InputAcceptMessage = @"You entered \"%@\".\n";
const NSString *GoodByeMessage = @"Good bye.\n";

@interface GameStart()

@property (strong, nonatomic) NSString *exitWord;
@property (strong, nonatomic) id<Game> game;

@end

@implementation GameStart

- (instancetype)initWithExitWord:(NSString *)exitWord {
    self = [super init];
    if (self) {
        self.exitWord = exitWord;
        self.game = [[Game8037 alloc] init];
    }
    return self;
}

- (void)startGame {
    if (self.game) {
        NSString *inputWord;
        
        do {
            [self.game greetWithExitWord:self.exitWord];
            inputWord = [self readLine];
        } while ([self checkInputWord:inputWord]);
    }
}

- (BOOL)checkInputWord:(NSString *)inputWord {
    BOOL isExitWord = [inputWord isEqualToString:self.exitWord];
    if (isExitWord) {
        NSLog(@"%@", GoodByeMessage);
    } else {
        [self.game checkUserAnswer:inputWord];
    }
    return !isExitWord;
}

- (NSString *)readLine {
    char inputValue;
    scanf("%s", &inputValue);
    return [NSString stringWithUTF8String:&inputValue];
}

@end
