//
//  ScoreHistory.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/7/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//MARK: - Score History

class ScoreHistory {
    fileprivate struct Constants {
        static var namelist = [String]()
        static var cardlist = [Card]()
        static var othercardlist = [[Card]]()
        static var scoretype = [String]()
        static var pointtotal = [Int]()
    }
    
    func addToHistory(_ name: String, card: Card, othercards: [Card], scoretype: String, pointvalue: Int) {
        Constants.namelist.insert(name, at: 0)
        Constants.cardlist.insert(card, at: 0)
        Constants.othercardlist.insert(othercards, at: 0)
        Constants.scoretype.insert(scoretype, at: 0)
        Constants.pointtotal.insert(pointvalue, at: 0)
    }
    
    func deleteScoreHistory() {
        Constants.namelist.removeAll()
        Constants.cardlist.removeAll()
        Constants.othercardlist.removeAll()
        Constants.scoretype.removeAll()
        Constants.pointtotal.removeAll()
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
