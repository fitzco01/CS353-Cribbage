//
//  History.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//MARK: - History

class History {
    fileprivate struct Constants {
        static var playList: [Card] = []
        static var playerList: [Player] = []
    }
    
    func deleteHistory() {
        Constants.playList.removeAll()
        Constants.playerList.removeAll()
    }
    
    func playHistory(_ card: Card) -> [Card] {
        Constants.playList.insert(card, at: 0)
        return Constants.playList
    }
    
    func getHistoryAtIndex(_ index: Int) -> Card {
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
    
    func playerHistory(_ player: Player) -> [Player] {
        Constants.playerList.insert(player, at: 0)
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
