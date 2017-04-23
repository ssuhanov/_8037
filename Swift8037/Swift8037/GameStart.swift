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
private let ErrorMessage = "There is unknown error, sorry. Good bye.\n"

class GameStart {
    
    private var exitWord: String
    
    init(with exitWord: String) {
        self.exitWord = exitWord
    }
    
    func startGame() {
        print(GreetingMessage.replacingOccurrences(of: ExitWordPlaceholder, with: self.exitWord))
        guard let inputWord = readLine() else {
            print(ErrorMessage)
            return
        }
        
        self.check(inputWord: inputWord)
    }
    
    private func check(inputWord: String) {
        if inputWord == self.exitWord {
            print(GoodByeMessage)
        } else {
            print(InputAcceptMessage.replacingOccurrences(of: InputWordPlaceholder, with: inputWord))
            startGame()
        }
    }
    
}
