//
//  GameLogic.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

class GameLogic {
    
    //var mainTimer: Timer
    var gameBoard: GameBoard!
    var score: Int
    var life: Int
    enum eType {
        case good, bad, life
    }
    
    init() {
        print("GameLogic.init() call")
        
        // other init of timer & gameBoard
        //self.mainTimer = Timer()
        self.gameBoard = GameBoard()
        self.score = 0
        self.life = 3
        
        
    }
    
    func startTimer() {
        //self.mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerReady), userInfo: nil, repeats: true)
    }
    
    @objc func timerReady() {
        print("timer++")
    }
    
    func clickOnTile(i: Int, j: Int) {
        
    }
    
    
    
    
}
