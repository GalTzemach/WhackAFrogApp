//
//  GameLogic.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

class GameLogic {
    
    var gameBoard: GameBoard!
    var score: Int
    var life: Int
    
    enum eType {
        case good, bad, life
    }
    
    
    init() {
        self.gameBoard = GameBoard()
        self.score = 0
        self.life = 3
    }

}
