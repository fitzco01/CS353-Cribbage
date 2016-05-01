//
//  Player.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct Player {
    var hand: [Card]
    var shorthand: [Card]
    var score: Int
    var isDealer: Bool
    var name: String
    
    mutating func makehand(somehand: [Card]) {
        var myhand = somehand
        for _ in myhand {
            let pop = myhand.popLast()
            self.hand.append(pop!)
        }
    }
    
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
    
    mutating func vanishingHand(runcarddescription: String) {
        
        if let i = shorthand.indexOf({$0.description() == runcarddescription}) {
            shorthand.removeAtIndex(i)
        }
        
    }
    
    func cannotPlay(total: Int) -> Bool {
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
    
    mutating func updatescore(points: Int) {
        self.score += points
    }
    
    func getscore() -> Int {
        return score
    }
}