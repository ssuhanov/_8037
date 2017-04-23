//
//  Game.h
//  ObjectiveC8037
//
//  Created by Serge Sukhanov on 4/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Game <NSObject>

- (void)greetWithExitWord:(NSString *)exitWord;
- (void)checkUserAnswer:(NSString *)userAnswer;

@end
