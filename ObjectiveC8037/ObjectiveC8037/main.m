//
//  main.m
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameStart.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameStart *gameStart = [[GameStart alloc] initWithExitWord:@"quit"];
        [gameStart startGame];
        
    }
    return 0;
}
