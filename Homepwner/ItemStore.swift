//
//  ItemStore.swift
//  Homepwner
//
//  Created by Erik Olson on 6/7/18.
//  Copyright © 2018 Erik Olson. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 { // wildcard, _, used because we do not need to access the iterating value. We just want this to loop 5 times. 
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item { //@discardable result means that we are free to discard the result rather than assigning it to a variable, as such: itemStore.createItem() instead of let newItem = itemStore.createItem(). Then why not just make this void? Because we *may* want to do something with the item returned. @discardableResult just means we can toss it if we wish by invoking without assigning to a variable. Another way to do this is to do _ = itemStore.createItem(), which basically just sends the return value to nowhere (a wildcard variable name that's impossible to reference), and can be done on any function/method, although with possibly dangerous consequences.
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
