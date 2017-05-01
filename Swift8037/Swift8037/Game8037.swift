//
//  Game8037.swift
//  Swift8037
//
//  Created by Serge Sukhanov on 4/23/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

private let LevelsPlaceholder = "{levels}"
private let LevelNumberPlaceholder = "{levelNumber}"
private let LevelPlaceholder = "{level}"
private let FirstNumberPlaceholder = "{firstNumber}"
private let SecondNumberPlaceholder = "{secondNumber}"
private let ThirdNumberPlaceholder = "{thirdNumber}"
private let FourthNumberPlaceholder = "{fourthNumber}"
private let ExitWordPlaceholder = "{exitWord}"
private let TaskPlaceholder = "{taskPlaceholder}"

private let EasyLevelNumber = "1"
private let NormalLevelNumber = "2"
private let Hard1LevelNumber = "3"
private let Hard2LevelNumber = "4"

private let StartGreeting = "Hello, let's play. Please select difficulty level:\(LevelsPlaceholder)"
private let LevelForSelect = "\n\(LevelNumberPlaceholder) - \(LevelPlaceholder)"
private let BaseGreeting = "\(FirstNumberPlaceholder) \(SecondNumberPlaceholder) \(ThirdNumberPlaceholder) \(FourthNumberPlaceholder)"
private let TaskMessage = "The next task is \(TaskPlaceholder)\n(enter \"\(ExitWordPlaceholder)\" for exit)"
private let CorrectMessage = "Absolutely right.\n"
private let WrongMessage = "Sorry, you made a mistake. Try again.\n"
private let ErrorLevelMessage = "Sorry, you have selected wrong level. Good bye.\n"

class Game8037: Game {
    
    private enum Level: String {
        case easy
        case normal
        case hard1
        case hard2
        
        func forSelect() -> String {
            let levelNumber: String
            switch self {
            case .easy:
                levelNumber = EasyLevelNumber
            case .normal:
                levelNumber = NormalLevelNumber
            case .hard1:
                levelNumber = Hard1LevelNumber
            case .hard2:
                levelNumber = Hard2LevelNumber
            }
            
            return LevelForSelect.replacingOccurrences(of: LevelNumberPlaceholder, with: levelNumber)
                .replacingOccurrences(of: LevelPlaceholder, with: self.rawValue)
        }
    }
    
    private var level: Level
    private var result: UInt32
    
    init?() {
        self.result = 0
        let levels = Level.easy.forSelect() + Level.normal.forSelect() + Level.hard1.forSelect() + Level.hard2.forSelect()
        print(StartGreeting.replacingOccurrences(of: LevelsPlaceholder, with: levels))
        
        let selectedLevel = readLine() ?? ""
        switch selectedLevel {
        case EasyLevelNumber, Level.easy.rawValue:
            self.level = .easy
        case NormalLevelNumber, Level.normal.rawValue:
            self.level = .normal
        case Hard1LevelNumber, Level.hard1.rawValue:
            self.level = .hard1
        case Hard2LevelNumber, Level.hard2.rawValue:
            self.level = .hard2
        default:
            print(ErrorLevelMessage)
            return nil
        }
    }
    
    private func result(with level: Level, and randomizer: Randomizer) -> UInt32 {
        let result: UInt32
        
        switch level {
        case .easy:
            result = randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber
        case .normal:
            result = randomizer.firstNumber*10 + randomizer.secondNumber + randomizer.thirdNumber*10 + randomizer.fourthNumber
        case .hard1:
            result = randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber
        case .hard2:
            result = (randomizer.firstNumber*10 + randomizer.secondNumber) * (randomizer.thirdNumber*10 + randomizer.fourthNumber)
        }
        
        return result
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
