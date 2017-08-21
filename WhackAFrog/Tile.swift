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

protocol TileInvisibleProtocol: class {
    func changeTileToInvisible(index: Int)
}

class Tile {
    
    weak var delegate: TileInvisibleProtocol?
    var timer: Timer
    var isVisible: Bool
    var typeOfTile: eType
    
    
    
    init() {
        //print("GameBoard.init() call")
        
        self.isVisible = false
        self.timer = Timer()
        self.typeOfTile = eType.blank
    }
    
    func visible(type: eType) {

        typeOfTile = type
        /// timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(invisible), userInfo: nil, repeats: false)
        
        self.isVisible = true
    }
    
    @objc func invisible() {
        
        /// print("item became invisible after timer")
        
        typeOfTile = eType.blank
        isVisible = false
        timer.invalidate()
        
        delegate?.changeTileToInvisible(index: 3)
    }
    
    func tileClicked() {
        
    }
    
}
