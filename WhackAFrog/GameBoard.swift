//
//  GameBoard.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

class GameBoard{
    
    let maxTile: Int = 10
    
    var tailMatrix = [Tile]()
    let maxTotalVisible: Int
    var currentTotalVisible: Int
    
    let maxGood: Int
    var currentGood: Int
    
    let maxBad: Int
    var currentBad: Int
    
    let maxLife: Int
    var maxCurrentLife: Int
    var currentLife: Int
    
    init() {
        /// print("GameBoard.init() call")
        
        for _ in 0...20{
            tailMatrix.append(Tile.init())
        }
        
        maxTotalVisible = maxTile
        maxGood = maxTile / 2
        maxBad = maxTile / 2
        maxLife = 3
        
        maxCurrentLife = 1
        
        currentTotalVisible = 0
        currentGood = 0
        currentBad = 0
        currentLife = 0
        
    }
    
    
}
