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
    
    init(with exitWord: String) {
        self.exitWord = exitWord
    }
    
    func startGame() {
        var inputWord: String
        repeat {
            print(GreetingMessage.replacingOccurrences(of: ExitWordPlaceholder, with: self.exitWord))
            inputWord = readLine() ?? ""
        } while check(inputWord: inputWord)
    }
    
    private func check(inputWord: String) -> Bool {
        let isExitWord = (inputWord == self.exitWord)
        print(isExitWord ? GoodByeMessage : InputAcceptMessage.replacingOccurrences(of: InputWordPlaceholder, with: inputWord))
        return !isExitWord
    }
    
}
