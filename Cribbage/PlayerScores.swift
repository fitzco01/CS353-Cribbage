//
//  PlayerScores.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/7/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//MARK: - Player Scores

class PlayerScores {
    
    //MARK: - Constants
    
    fileprivate struct Constants {
        static var playerScoreDict = [String: Int]()
    }
    
    func addPlayers(_ playername: String) {
        Constants.playerScoreDict[playername] = 0
    }
    
    func addScore(_ playername: String, newpoints: Int) -> Bool {
        Constants.playerScoreDict[playername]! += newpoints
        if Constants.playerScoreDict[playername]! >= 121 {
            return true
        } else {
            return false
        }
    }
    
    func getScore(_ playername: String) -> Int {
        return Constants.playerScoreDict[playername]!
    }
}
