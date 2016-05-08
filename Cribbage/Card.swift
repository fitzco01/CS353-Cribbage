//
//  Card.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

enum Suit: Int {
    case spades, hearts, diamonds, clubs
    func description() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades:
            return "Black"
        case .clubs:
            return "Black"
        case .diamonds:
            return "Red"
        case .hearts:
            return "Red"
        }
    }
}

enum Rank: Int {
    case one, two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func description() -> String {
        switch self {
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue + 1)
        }
    }
    
    func value() -> Int {
        switch self {
        case .jack:
            return 10
        case .queen:
            return 10
        case .king:
            return 10
        default:
            return self.rawValue + 1
        }
    }
    
    func ordinal() -> Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .jack:
            return 11
        case .queen:
            return 12
        case .king:
            return 13
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func description() -> String {
        return "\(rank.description())_of_\(suit.description())"
    }
}

