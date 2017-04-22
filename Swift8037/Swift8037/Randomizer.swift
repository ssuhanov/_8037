//
//  Randomizer.swift
//  Swift8037
//
//  Created by Serge Sukhanov on 4/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

class Randomizer {
    
    var firstNumber: UInt32
    var secondNumber: UInt32
    var thirdNumber: UInt32
    var fourthNumber: UInt32
    
    init() {
        self.firstNumber = arc4random() % 9 + 1
        self.secondNumber = arc4random() % 10
        self.thirdNumber = arc4random() % 10
        self.fourthNumber = arc4random() % 10
    }
}
