//
//  GameStart.h
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStart : NSObject

- (instancetype)initWithExitWord:(NSString *)exitWord;
- (void)startGame;

@end
