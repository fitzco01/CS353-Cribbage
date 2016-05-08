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