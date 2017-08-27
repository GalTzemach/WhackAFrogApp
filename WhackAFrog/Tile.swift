//
//  Tile.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

enum eType {
    case blank, good, bad, life
}

class Tile {
    
    var timer: Timer
    var isVisible: Bool
    var typeOfTile: eType
    
    
    init() {
        
        self.isVisible = false
        self.timer = Timer()
        self.typeOfTile = eType.blank
    }
    
    func visible(type: eType) {

        typeOfTile = type
        self.isVisible = true
        
        /// timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(invisible), userInfo: nil, repeats: false)
    }
    
    @objc func invisible() {
        
        typeOfTile = eType.blank
        isVisible = false
        
        /// timer.invalidate()
    }
    
}
