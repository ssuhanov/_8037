//
//  Randomizer.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "Randomizer.h"

@implementation Randomizer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.firstNumber = arc4random() % 9 + 1;
        self.secondNumber = arc4random() % 10;
        self.thirdNumber = arc4random() % 10;
        self.fourthNumber = arc4random() % 10;
    }
    return self;
}

@end
