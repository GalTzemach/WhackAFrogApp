//
//  GameBoard.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

class GameBoard{
    
    // var tailMatrix: [[Tile]]
    let maxTotalVisible: Int
    var currentTotalVisible: Int
    
    let maxGood: Int
    var currentGood: Int
    
    let maxBad: Int
    var currentBad: Int
    
    let maxLife: Int
    var currentLife: Int
    
    init() {
        maxTotalVisible = 0//(count(tailMatrix) * count(tailMatrix[0])) / 0.5
        currentTotalVisible = 0
        currentGood = 0
        currentBad = 0
        currentLife = 0
        maxGood = maxTotalVisible - 2
        maxBad = maxGood / 2
        maxLife = 1
    }
    
    
}
