//
//  Record.swift
//  WhackAFrog
//
//  Created by Tal Zemah on 17/09/2017.
//  Copyright © 2017 Tal Zemah. All rights reserved.
//

import UIKit
import CoreLocation

class Record: NSObject, NSCoding {
    
    let score: Int
    let name: String
    let latitude: String
    let longitude: String
    
    init(score: Int, name: String, latitude: String, longitude: String) {
        self.score = score
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init(coder decoder: NSCoder) {
        self.score = decoder.decodeInteger(forKey: "score")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.latitude = decoder.decodeObject(forKey: "latitude") as? String ?? ""
        self.longitude = decoder.decodeObject(forKey: "longitude") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(score, forKey: "score")
        coder.encode(name, forKey: "name")
        coder.encode(latitude, forKey: "latitude")
        coder.encode(longitude, forKey: "longitude")
    }
    
    func show() {
        print("Record: \nScore = ", score, "\nName = ", name, "\nLocation = [latitude: ", latitude, ", longitude: ", longitude, "]")
    }
    
}
