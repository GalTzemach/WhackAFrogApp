//
//  Tile.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 20/08/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//
import Foundation


protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: Int)
}

enum eType {
    case blank, good, bad, life
}

class Tile {
    
    /// 
    weak var delegate: DataModelDelegate?

    var names: [String] = ["blank", "good", "bad", "life"]
    
    var location: Int
    var timer: Timer
    var isVisible: Bool
    var typeOfTile: eType
    
    
    init() {
        
        self.location = -1
        self.isVisible = false
        self.timer = Timer()
        self.typeOfTile = eType.blank
    }
    
    ///
    func requestData() {
        // the data was received and parsed to String
        
        ///let data = "Data from cell number: " + String(location) + " finish timer"
        let data: Int = location
        delegate?.didRecieveDataUpdate(data: data)
    }
    
    func visible(type: eType, location: Int) {

        typeOfTile = type
        self.isVisible = true
        self.location = location
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(tileDisappeare), userInfo: nil, repeats: false)
    }
    
    @objc func tileDisappeare() {
        
        requestData()
    }
    
    func invisible() {
        
        typeOfTile = eType.blank
        isVisible = false
        self.location = -1
        
        timer.invalidate()
    }
    
}
