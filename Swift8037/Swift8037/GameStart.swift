//
//  GameStart.swift
//  Swift8037
//
//  Created by Serge Sukhanov on 4/15/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

private let ExitWordPlaceholder = "{exitWord}"
private let InputWordPlaceholder = "{inputWord}"

private let GreetingMessage = "Please enter your answer (enter \"\(ExitWordPlaceholder)\" for exit):"
private let InputAcceptMessage = "You entered \"\(InputWordPlaceholder)\".\n"
private let GoodByeMessage = "Good bye.\n"

class GameStart {
    
    private var exitWord: String
    private var game: Game
    
    init?(with exitWord: String) {
        self.exitWord = exitWord
        if let game = Game8037() {
            self.game = game
        } else {
            return nil
        }
    }
    
    func startGame() {
        var inputWord: String
        repeat {
            self.game.greet(with: self.exitWord)
            inputWord = readLine() ?? ""
        } while check(inputWord: inputWord)
    }
    
    private func check(inputWord: String) -> Bool {
        let isExitWord = (inputWord == self.exitWord)
        if isExitWord {
            print(GoodByeMessage)
        } else {
            self.game.check(userAnswer: inputWord)
        }
        return !isExitWord
    }
    
}
