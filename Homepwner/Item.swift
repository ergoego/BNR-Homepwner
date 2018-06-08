//
//  Item.swift
//  Homepwner
//
//  Created by Erik Olson on 6/7/18.
//  Copyright © 2018 Erik Olson. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date


    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init() // designated initializers must call a designated initializer on its superclass
    }
    
    convenience init(random: Bool = false) { // will only randomize if true is passed as argument, else an item object is created with 0 and nil values.
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy:"-").first!
            
            self.init(name: randomName, // convenience initializers must call on the same type                
                        valueInDollars: randomValue,
                        serialNumber: randomSerialNumber
                      )
        } else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil) // convenience initializers must call on the same type
        }
    }
}
