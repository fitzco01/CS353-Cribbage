//
//  History.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class History {
    private struct Constants {
        static var playList: [Card] = []
        static var playerList: [Player] = []
    }
    
    func deleteHistory() {
        Constants.playList.removeAll()
        Constants.playerList.removeAll()
    }
    
    func playHistory(card: Card) -> [Card] {
        Constants.playList.insert(card, atIndex: 0)
        return Constants.playList
    }
    
    func getHistoryAtIndex(index: Int) -> Card {
        return Constants.playList[index]
    }
    
    func historyMinusLastPlay() -> [Card] {
        var returnlist = [Card]()
        var loop = 0
        for acard in Constants.playList {
            if loop != 0 {
            returnlist.append(acard)
            }
            loop += 1
        }
        return returnlist
    }
    
    func playerHistory(player: Player) -> [Player] {
        Constants.playerList.insert(player, atIndex: 0)
        return Constants.playerList
    }
    
    func showPlayHistory() -> [Card] {
        return Constants.playList
    }
    
    func showPlayerHistory() -> [Player] {
        return Constants.playerList
    }
    
    func mostRecentPlayer() -> Player {
        return Constants.playerList.first!
    }
    
    func mostRecentPlay() -> Card {
        return Constants.playList.first!
    }
    
    func playLength() -> Int {
        return Constants.playList.count
    }
    
    func playerLength() -> Int {
        return Constants.playerList.count
    }
}