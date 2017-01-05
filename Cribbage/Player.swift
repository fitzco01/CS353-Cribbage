//
//  Player.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//MARK: - Player

struct Player {
    var hand: [Card]
    var shorthand: [Card]
    var isDealer: Bool
    var name: String
    
    mutating func makehand(_ somehand: [Card]) {
        var myhand = somehand
        for _ in myhand {
            let pop = myhand.popLast()
            self.hand.append(pop!)
        }
    }
    
    mutating func somenewhand(_ somehand: [Card]) {
        self.hand = somehand
    }
    
    mutating func somenewshorthand(_ somehand: [Card]) {
        self.shorthand = somehand
    }
    
    mutating func deletecardfromhand(_ index: Int) -> [Card] {
        self.hand.remove(at: index)
        return self.hand
    }
    
    mutating func deletecardfromhandbystring(_ cardname: String) -> [Card] {
        var loop = 0
        for acard in self.hand {
            if acard.description() == cardname {
                self.hand.remove(at: loop)
            }
            loop += 1
        }
        loop = 0
        return self.hand
    }
    
    mutating func deletecardfromshorthandbystring(_ cardname: String) -> Card {
        var loop = 0
        var deletedcard = [Card]()
        deletedcard.removeAll()
        for acard in self.shorthand {
            if acard.description() == cardname {
                deletedcard.append(self.shorthand.remove(at: loop))
            }
            loop += 1
        }
        loop = 0
        return deletedcard[0]
    }

    // YAY
    // IT WORKS
    
    func printhand() -> [String] {
        var printlist: [String] = []
        for acard in self.hand {
            printlist.append(acard.description())
        }
        return printlist
    }
    
    func myNameIs() -> String {
        return name
    }
    
    mutating func vanishingHand(_ runcarddescription: String) {
        
        if let i = shorthand.index(where: {$0.description() == runcarddescription}) {
            shorthand.remove(at: i)
        }
    }
    
    func cannotPlay(_ total: Int) -> Bool {
        var cannotplay = true
        if shorthand.count == 0 {
            return cannotplay
        }
        for acard in shorthand {
            if acard.rank.rawValue + total <= 31 {
                cannotplay = false
            }
            if cannotplay == false {
                return cannotplay
            }
        }
        return cannotplay
    }
    
    func whoDealt() -> Bool {
        return isDealer
    }
    
    func printhand() -> String {
        var mystring = ""
        for acard in hand {
            mystring += acard.description() + "\n"
        }
        return mystring
    }
    
    func showhand() -> [Card] {
        return hand
    }
}
