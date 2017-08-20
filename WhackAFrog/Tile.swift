//
//  Tile.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import Foundation

class Tile {
    
    var timer: Timer
    var isVisible: Bool
    enum eType {
        case good, bad, life
    }
    
    init() {
        self.isVisible = false
        self.timer = Timer()
    }
    
    func visible() {
        
    }
    
    func invisible() {
        
    }
    
    func tileClicked() {
        
    }
    
}
