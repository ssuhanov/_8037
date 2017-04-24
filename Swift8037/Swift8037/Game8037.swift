//
//  Game8037.swift
//  Swift8037
//
//  Created by Serge Sukhanov on 4/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

private let LevelPlaceholder = "{level}"
private let FirstNumberPlaceholder = "{firstNumber}"
private let SecondNumberPlaceholder = "{secondNumber}"
private let ThirdNumberPlaceholder = "{thirdNumber}"
private let FourthNumberPlaceholder = "{fourthNumber}"
private let ExitWordPlaceholder = "{exitWord}"
private let TaskPlaceholder = "{taskPlaceholder}"

private let StartGreeting = "Hello, let's play. Current difficulty level is \(LevelPlaceholder)\n"
private let BaseGreeting = "\(FirstNumberPlaceholder) \(SecondNumberPlaceholder) \(ThirdNumberPlaceholder) \(FourthNumberPlaceholder)"
private let TaskMessage = "The next task is \(TaskPlaceholder)\n(enter \"\(ExitWordPlaceholder)\" for exit)"
private let CorrectMessage = "Absolutely right.\n"
private let WrongMessage = "Sorry, you made a mistake. Try again.\n"

class Game8037: Game {
    
    private enum Level: String {
        case easy
        case normal
        case hard1
        case hard2
    }
    
    private var level: Level
    private var result: UInt32
    
    init() {
        self.level = .normal
        self.result = 0
        print(StartGreeting.replacingOccurrences(of: LevelPlaceholder, with: self.level.rawValue))
    }
    
    private func result(with level: Level, and randomizer: Randomizer) -> UInt32 {
        switch level {
        case .easy:
            return randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber
        case .normal:
            return randomizer.firstNumber*10 + randomizer.secondNumber + randomizer.thirdNumber*10 + randomizer.fourthNumber
        case .hard1:
            return randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber
        case .hard2:
            return (randomizer.firstNumber*10 + randomizer.secondNumber) * (randomizer.thirdNumber*10 + randomizer.fourthNumber)
        }
    }
    
    // MARK: - Game
    
    func greet(with exitWord: String) {
        let randomizer = Randomizer()
        self.result = self.result(with: self.level, and: randomizer)
        let task = BaseGreeting.replacingOccurrences(of: FirstNumberPlaceholder, with: "\(randomizer.firstNumber)")
            .replacingOccurrences(of: SecondNumberPlaceholder, with: "\(randomizer.secondNumber)")
            .replacingOccurrences(of: ThirdNumberPlaceholder, with: "\(randomizer.thirdNumber)")
            .replacingOccurrences(of: FourthNumberPlaceholder, with: "\(randomizer.fourthNumber)")
        
        print(TaskMessage.replacingOccurrences(of: TaskPlaceholder, with: task)
            .replacingOccurrences(of: ExitWordPlaceholder, with: exitWord))
    }
    
    func check(userAnswer: String) {
        if self.result == UInt32(userAnswer) {
            print(CorrectMessage)
        } else {
            print(WrongMessage)
        }
    }
    
}
