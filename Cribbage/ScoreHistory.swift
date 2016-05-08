//
//  ScoreHistory.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/7/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class ScoreHistory {
    
    private struct Constants {
        static var namelist = [String]()
        static var cardlist = [Card]()
        static var othercardlist = [[Card]]()
        static var scoretype = [String]()
        static var pointtotal = [Int]()
    }
    
    func addToHistory(name: String, card: Card, othercards: [Card], scoretype: String, pointvalue: Int) {
        Constants.namelist.insert(name, atIndex: 0)
        Constants.cardlist.insert(card, atIndex: 0)
        Constants.othercardlist.insert(othercards, atIndex: 0)
        Constants.scoretype.insert(scoretype, atIndex: 0)
        Constants.pointtotal.insert(pointvalue, atIndex: 0)
    }
    
    func getPointValue() -> [Int] {
        return Constants.pointtotal
    }
    
    func getNames() -> [String] {
        return Constants.namelist
    }
    
    func getCard() -> [Card] {
        return Constants.cardlist
    }
    
    func getCards() -> [[Card]] {
        return Constants.othercardlist
    }
    
    func getScoreType() -> [String] {
        return Constants.scoretype
    }
}