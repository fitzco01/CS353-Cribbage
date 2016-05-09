//
//  PlayerScores.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/7/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class PlayerScores {
    
    private struct Constants {
        static var playerScoreDict = [String: Int]()
    }
    
    func addPlayers(playername: String) {
        Constants.playerScoreDict[playername] = 0
    }
    
    func addScore(playername: String, newpoints: Int) {
        Constants.playerScoreDict[playername]! += newpoints
    }
    
    func getScore(playername: String) -> Int {
        return Constants.playerScoreDict[playername]!
    }
    
    func winner(playername: String) -> Bool {
        if Constants.playerScoreDict[playername]! >= 121 {
            return true
        } else {
            return false
        }
    }
}