//
//  Scoring.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/1/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

// MARK: - Ordering

struct Order {
    var historylist = History().showPlayHistory()
    
    func orderByValue() -> [Card] {
        let valueorderlist = historylist.sort { $0.rank.value() < $1.rank.value() }
        return valueorderlist
    }
    
    func orderByOrdinal() -> [Card] {
        let valueorderlist = historylist.sort { $0.rank.ordinal() < $1.rank.ordinal() }
        return valueorderlist
    }
    
    func getHistory() -> [Card] {
        return historylist
    }
}

class ScoringRun {
    
    private struct Constants {
        static var boolpoints = false
        static var someruncount = 0
    }
    
    func updateruncount(somecard: Card) {
        Constants.someruncount += somecard.rank.value()
    }
    
    // MARK: - Run Scoring

    func straight(playername: String) -> Int {
        var count = 0
        var checklist = [Card]()
        var finalcards = [Card]()
        for acard in History().showPlayHistory() {
            checklist.insert(acard, atIndex: 0)
            let valueorderlist = checklist.sort { $0.rank.ordinal() < $1.rank.ordinal() }

            if valueorderlist.count == 3 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 {
                    count = 3
                    finalcards = [valueorderlist[0],valueorderlist[1]]
                }
            }
            if valueorderlist.count == 4 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 {
                    count = 4
                    finalcards = [valueorderlist[0],valueorderlist[1],valueorderlist[2]]
                }
            }
            if valueorderlist.count == 5 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() - 1{
                    count = 5
                    finalcards = [valueorderlist[0],valueorderlist[1],valueorderlist[2],valueorderlist[3]]
                }
            }
            if valueorderlist.count == 6 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() - 1{
                    count = 6
                    finalcards = [valueorderlist[0],valueorderlist[1],valueorderlist[2],valueorderlist[3],valueorderlist[4]]
                }
            }
            if valueorderlist.count == 7 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() && valueorderlist[5].rank.ordinal() == valueorderlist[6].rank.ordinal() - 1 {
                    count = 7
                    finalcards = [valueorderlist[0],valueorderlist[1],valueorderlist[2],valueorderlist[3],valueorderlist[4],valueorderlist[5]]
                }
            }
            if valueorderlist.count == 8 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() && valueorderlist[5].rank.ordinal() == valueorderlist[6].rank.ordinal() - 1 && valueorderlist[6].rank.ordinal() == valueorderlist[7].rank.ordinal() - 1 {
                    count = 8
                    finalcards = [valueorderlist[0],valueorderlist[1],valueorderlist[2],valueorderlist[3],valueorderlist[4],valueorderlist[5],valueorderlist[6]]
                }
            }
        }
        if count != 0 {
            ScoreHistory().addToHistory(playername, card: History().mostRecentPlay(), othercards: finalcards, scoretype: "straight", pointvalue: count)
        }
        return count
    }
    
    func fifteencount(playername: String) -> Int {
        var count = 0
        for acard in History().showPlayHistory() {
            count += acard.rank.value()
        }
        if count == 15 || count == 31 {
            
            let card = History().mostRecentPlay()

            ScoreHistory().addToHistory(playername, card: card, othercards: History().historyMinusLastPlay(), scoretype: "\(count)", pointvalue: 2)

            return 2
        } else {
            return 0
        }
    }
    
    func SomeOfAKind(playername: String) -> Int {
        var historylist = Order().getHistory()
        
        var count = 0
        var text = ""
        
        if historylist.count >= 2 {
            
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            
            if temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 2
                text = "pair"
            }
        }
        if historylist.count >= 3 {
            
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            let temp2 = historylist[2]
            
            if temp2.rank.ordinal() == temp1.rank.ordinal() && temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 6
                text = "three of a kind"
            }
        }
        if historylist.count >= 4 {
            
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            let temp2 = historylist[2]
            let temp3 = historylist[3]
            
            if temp3.rank.ordinal() == temp2.rank.ordinal() && temp2.rank.ordinal() == temp1.rank.ordinal() && temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 12
                text = "four of a kind"
            }
        }
        if count != 0 {
            let othercards : [Card] = Array(historylist[1..<historylist.count])

            ScoreHistory().addToHistory(playername, card: historylist[0], othercards: othercards, scoretype: text, pointvalue: count)
        }
        return count
    }
    
    func getruncount() -> Int {
        return Constants.someruncount
    }
    
    func lastcard(playername: String) -> Int {
        ScoreHistory().addToHistory(playername, card: History().mostRecentPlay(), othercards: History().showPlayHistory(), scoretype: "last card", pointvalue: 1)
        return 1
    }
    
    func jackflip(playername: String) -> Int {
        if CribbageDeck().getCutCardCard().rank.description() == "jack" {
            
            ScoreHistory().addToHistory(playername, card: CribbageDeck().getCutCardCard(), othercards: [CribbageDeck().getCutCardCard()], scoretype: "nibs", pointvalue: 2)
            
            return 2
        } else {
            return 0
        }
    }
    
}

class ScoringHand {
    
    // MARK: - SubDecks
    
    func makeSubDecksOf2From5(somehand: [Card]) -> [String:[Card]] {
        var subdeckdict2 = ["twodeck1": [somehand[0],somehand[1]]]
        subdeckdict2["twodeck2"] = [somehand[0],somehand[2]]
        subdeckdict2["twodeck3"] = [somehand[0],somehand[3]]
        subdeckdict2["twodeck4"] = [somehand[0],somehand[4]]
        subdeckdict2["twodeck5"] = [somehand[1],somehand[2]]
        subdeckdict2["twodeck6"] = [somehand[1],somehand[3]]
        subdeckdict2["twodeck7"] = [somehand[1],somehand[4]]
        subdeckdict2["twodeck8"] = [somehand[2],somehand[3]]
        subdeckdict2["twodeck9"] = [somehand[2],somehand[4]]
        subdeckdict2["twodeck10"] = [somehand[3],somehand[4]]
        
        return subdeckdict2
    }
    
    func makeSubDecksOf3From5(somehand: [Card]) -> [String:[Card]] {
        var subdeckdict3 = ["threedeck1": [somehand[0],somehand[1],somehand[2]]]
        subdeckdict3["threedeck2"] = [somehand[0],somehand[1],somehand[3]]
        subdeckdict3["threedeck5"] = [somehand[0],somehand[1],somehand[4]]
        subdeckdict3["threedeck3"] = [somehand[0],somehand[2],somehand[3]]
        subdeckdict3["threedeck6"] = [somehand[0],somehand[2],somehand[4]]
        subdeckdict3["threedeck8"] = [somehand[0],somehand[3],somehand[4]]
        subdeckdict3["threedeck4"] = [somehand[1],somehand[2],somehand[3]]
        subdeckdict3["threedeck7"] = [somehand[1],somehand[2],somehand[4]]
        subdeckdict3["threedeck9"] = [somehand[1],somehand[3],somehand[4]]
        subdeckdict3["threedeck10"] = [somehand[2],somehand[3],somehand[4]]
        
        for (_, value) in subdeckdict3 {
            print("VALUES \(value)")
        }
        return subdeckdict3
    }
    
    func makeSubDecksOf4From5(somehand: [Card]) -> [String:[Card]] {
        var subdeckdict4 = ["fourdeck1": [somehand[0],somehand[1],somehand[2],somehand[3]]]
        subdeckdict4["fourdeck2"] = [somehand[0],somehand[1],somehand[2],somehand[4]]
        subdeckdict4["fourdeck3"] = [somehand[0],somehand[1],somehand[3],somehand[4]]
        subdeckdict4["fourdeck4"] = [somehand[0],somehand[2],somehand[3],somehand[4]]
        subdeckdict4["fourdeck5"] = [somehand[1],somehand[2],somehand[3],somehand[4]]

        return subdeckdict4
    }
    
    // MARK: - Hand Scoring
    
    func jackinhand(playername: String, somehand: [Card]) -> Int {
        var count = 0
        for acard in somehand {
            if acard.rank.description() == "jack" && acard.suit.description() == CribbageDeck().getCutCardCard().suit.description() {
                count = 1
                ScoreHistory().addToHistory(playername, card: acard, othercards: [CribbageDeck().getCutCardCard()], scoretype: "nobs", pointvalue: 1)
            }
        }
        
        return count
    }

    func SomeOfAKind(playername: String, ahand: [Card]) -> Int {
        var count = 0
        let twodict = makeSubDecksOf2From5(ahand)
        let threedict = makeSubDecksOf3From5(ahand)
        let fourdict = makeSubDecksOf4From5(ahand)
        var marker = ""
        
        for (_, value) in fourdict {
            if value[0].rank.ordinal() == value[1].rank.ordinal() && value[1].rank.ordinal() == value[2].rank.ordinal() && value[2].rank.ordinal() == value[3].rank.ordinal() {
                count = 12
                
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1], value[2], value[3]], scoretype: "four of a kind", pointvalue: 12)
                return count
            }
        }
        
        for (_, value) in threedict {
            if value[0].rank.ordinal() == value[1].rank.ordinal() && value[1].rank.ordinal() == value[2].rank.ordinal() {
                count += 6
                
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1], value[2]], scoretype: "three of a kind", pointvalue: 6)
                
                marker = value[0].rank.description()
            }
        }
        
        for (_, value) in twodict {
            if value[0].rank.ordinal() == value[1].rank.ordinal() {
                if marker != value[0].rank.description() && marker != value[1].rank.description() {
                    count += 2
                
                    ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1]], scoretype: "pair", pointvalue: 2)
                }
            }
        }
        
        return count
    }
    
    func fifteencount(playername: String, ahand: [Card]) -> Int {
        var count = 0
        let twodict = makeSubDecksOf2From5(ahand)
        let threedict = makeSubDecksOf3From5(ahand)
        let fourdict = makeSubDecksOf4From5(ahand)
        
        for (_, value) in twodict {
            if value[0].rank.value() + value[1].rank.value() == 15 {
                count += 2
                
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1]], scoretype: "fifteen", pointvalue: 2)
            }
        }
        
        for (_, value) in threedict {
            if value[0].rank.value() + value[1].rank.value() + value[2].rank.value() == 15 {
                count += 2
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1],value[2]], scoretype: "fifteen", pointvalue: 2)
            }
        }
        
        for (_, value) in fourdict {
            if value[0].rank.value() + value[1].rank.value() + value[2].rank.value() +  value[3].rank.value() == 15 {
                count += 2
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1],value[2],value[3]], scoretype: "fifteen", pointvalue: 2)

            }
        }
        
        if ahand[0].rank.value() + ahand[1].rank.value() + ahand[2].rank.value() + ahand[3].rank.value() + ahand[4].rank.value() == 15 {
            count += 2
            ScoreHistory().addToHistory(playername, card: ahand[0], othercards: [ahand[1],ahand[2],ahand[3],ahand[4]], scoretype: "fifteen", pointvalue: 2)
        }
        
        return count
    }
    
    func straight(playername: String, ahand: [Card]) -> Int{
        var count = 0
        let threedict = makeSubDecksOf3From5(ahand)
        let fourdict = makeSubDecksOf4From5(ahand)
        let sorthand = ahand.sort { $0.rank.ordinal() < $1.rank.ordinal() }
        
        print("straight check 1 \(sorthand)")
        if sorthand[0].rank.ordinal() == sorthand[1].rank.ordinal() - 1 && sorthand[1].rank.ordinal() == sorthand[2].rank.ordinal() - 1 && sorthand[2].rank.ordinal() == sorthand[3].rank.ordinal() - 1 && sorthand[3].rank.ordinal() == sorthand[4].rank.ordinal() - 1 {
            count = 5
            
            ScoreHistory().addToHistory(playername, card: sorthand[0], othercards: [sorthand[1],sorthand[2],sorthand[3],sorthand[4]], scoretype: "straight", pointvalue: count)

            return count
        }
        
        for (_, value) in fourdict {
            let sorthand = value.sort { $0.rank.ordinal() < $1.rank.ordinal() }
            print("straight check 2 \(sorthand)")

            if sorthand[0].rank.ordinal() == sorthand[1].rank.ordinal() - 1 && sorthand[1].rank.ordinal() == sorthand[2].rank.ordinal() - 1 && sorthand[2].rank.ordinal() == sorthand[3].rank.ordinal() - 1 {
                count += 4
                ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1],value[2],value[3]], scoretype: "straight", pointvalue: 4)
            }
        }
        if count == 0 {
            for (_, value) in threedict {
                let sorthand = value.sort { $0.rank.ordinal() < $1.rank.ordinal() }
                print("straight check 3 \(sorthand)")

                if sorthand[0].rank.ordinal() == sorthand[1].rank.ordinal() - 1 && sorthand[1].rank.ordinal() == sorthand[2].rank.ordinal() - 1 {
                    count += 3

                    ScoreHistory().addToHistory(playername, card: value[0], othercards: [value[1],value[2]], scoretype: "straight", pointvalue: 3)
                }
            }
        }
        
        return count
    }
    
    func fourflush(playername: String, justplayerhand: [Card]) -> Int {
        var count = 0
        let suitchecker = justplayerhand[0].suit.description()
        for acard in justplayerhand {
            if acard.suit.description() == suitchecker {
                count = justplayerhand.count
            } else {
                return 0
            }
        }
        ScoreHistory().addToHistory(playername, card: justplayerhand[0], othercards: [justplayerhand[1],justplayerhand[2],justplayerhand[3]], scoretype: "flush", pointvalue: count)

        return count
    }
    
    func fiveflush(playername: String, handandcutcardORcrib: [Card]) -> Int {
        var count = 0
        let suitchecker = handandcutcardORcrib[0].suit.description()
        for acard in handandcutcardORcrib {
            if acard.suit.description() == suitchecker {
                count = handandcutcardORcrib.count
            } else {
                return 0
            }
        }
        ScoreHistory().addToHistory(playername, card: handandcutcardORcrib[0], othercards: [handandcutcardORcrib[1],handandcutcardORcrib[2],handandcutcardORcrib[3],handandcutcardORcrib[4]], scoretype: "flush", pointvalue: count)

        return count
    }
    
    //ADD Good Jack!!!?
    
}

// MARK: - Scoring Checks for computer cards
// make this work with BestPlay.PickACard
// add function calls to BestPlay.PickACard

struct CPUOrder {
    var historylist = History().showPlayHistory()
    
    func orderByValue(cardlist: [Card]) -> [Card] {
        let valueorderlist = cardlist.sort { $0.rank.value() < $1.rank.value() }
        return valueorderlist
    }
    
    func orderByOrdinal(cardlist: [Card]) -> [Card] {
        let valueorderlist = cardlist.sort { $0.rank.ordinal() < $1.rank.ordinal() }
        return valueorderlist
    }
    
    func getHistory() -> [Card] {
        return historylist
    }
}

class CPUScoringRun {
    
    private struct Constants {
        static var boolpoints = false
        static var someruncount = 0
        
        static var checkthislist: [Card] = []
    }
    
    func addcard(somecard: Card) -> [Card] {
        Constants.checkthislist = CPUOrder().getHistory()
        Constants.checkthislist.append(somecard)
        return Constants.checkthislist
    }
    
    func checkruncount(somecard: Card) {
        Constants.someruncount += somecard.rank.value()
    }
    
    // MARK: - Run Scoring
    func straight(cardone: Card) -> Int {
        var history = addcard(cardone)
        //newest card at the end
        history.removeLast()
        history.insert(cardone, atIndex: 0)
        
        var count = 0
        var checklist = [Card]()
        for acard in history {
            checklist.insert(acard, atIndex: 0)
            let valueorderlist = checklist.sort { $0.rank.ordinal() < $1.rank.ordinal() }
            
            if valueorderlist.count == 3 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 {
                    count = 3
                }
            }
            if valueorderlist.count == 4 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 {
                    count = 4
                }
            }
            if valueorderlist.count == 5 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() - 1{
                    count = 5
                }
            }
            if valueorderlist.count == 6 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() - 1{
                    count = 6
                }
            }
            if valueorderlist.count == 7 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() && valueorderlist[5].rank.ordinal() == valueorderlist[6].rank.ordinal() - 1 {
                    count = 7
                }
            }
            if valueorderlist.count == 8 {
                if valueorderlist[0].rank.ordinal() == valueorderlist[1].rank.ordinal() - 1 && valueorderlist[1].rank.ordinal() == valueorderlist[2].rank.ordinal() - 1 && valueorderlist[2].rank.ordinal() == valueorderlist[3].rank.ordinal() - 1 && valueorderlist[3].rank.ordinal() == valueorderlist[4].rank.ordinal() && valueorderlist[4].rank.ordinal() == valueorderlist[5].rank.ordinal() && valueorderlist[5].rank.ordinal() == valueorderlist[6].rank.ordinal() - 1 && valueorderlist[6].rank.ordinal() == valueorderlist[7].rank.ordinal() - 1 {
                    count = 8
                }
            }
        }
        return count
    }
    
    func fifteencount(cardone: Card) -> Int {
        
        let history = addcard(cardone)
        var count = 0
        for acard in history {
            count += acard.rank.value()
        }
        if count == 15 || count == 31 {
            return 2
        } else {
            return 0
        }
    }
    
    func SomeOfAKind(cardone: Card) -> Int {
        var historylist = addcard(cardone)
        
        var count = 0

        if historylist.count >= 2 {
        
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            
            if temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 2
            }
        }
        
        if historylist.count >= 3 {
                
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            let temp2 = historylist[2]
                
            if temp2.rank.ordinal() == temp1.rank.ordinal() && temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 6
            }
        }
        
        if historylist.count >= 4 {
                
            let temp0 = historylist[0]
            let temp1 = historylist[1]
            let temp2 = historylist[2]
            let temp3 = historylist[3]
                
            if temp3.rank.ordinal() == temp2.rank.ordinal() && temp2.rank.ordinal() == temp1.rank.ordinal() && temp1.rank.ordinal() == temp0.rank.ordinal() {
                count = 12
            }
        }
        

        return count
    }
}

class CPUScoringHand {
    func makeSubDecksOf4From6(somehand: [Card]) -> [String: [Card]] {
        
        var subdeckdict4to6 = ["sixdeck1": [somehand[0],somehand[1],somehand[2],somehand[3]]]
        subdeckdict4to6["sixdeck2"] = [somehand[0],somehand[1],somehand[2],somehand[4]]
        subdeckdict4to6["sixdeck3"] = [somehand[0],somehand[1],somehand[2],somehand[5]]
        subdeckdict4to6["sixdeck4"] = [somehand[0],somehand[1],somehand[3],somehand[4]]
        subdeckdict4to6["sixdeck5"] = [somehand[0],somehand[1],somehand[3],somehand[5]]
        subdeckdict4to6["sixdeck6"] = [somehand[0],somehand[1],somehand[4],somehand[5]]
        subdeckdict4to6["sixdeck7"] = [somehand[0],somehand[2],somehand[3],somehand[4]]
        subdeckdict4to6["sixdeck8"] = [somehand[0],somehand[2],somehand[3],somehand[5]]
        subdeckdict4to6["sixdeck9"] = [somehand[0],somehand[2],somehand[4],somehand[5]]
        subdeckdict4to6["sixdeck10"] = [somehand[0],somehand[3],somehand[4],somehand[5]]
        subdeckdict4to6["sixdeck11"] = [somehand[1],somehand[2],somehand[3],somehand[4]]
        subdeckdict4to6["sixdeck12"] = [somehand[1],somehand[2],somehand[3],somehand[5]]
        subdeckdict4to6["sixdeck13"] = [somehand[1],somehand[2],somehand[4],somehand[5]]
        subdeckdict4to6["sixdeck14"] = [somehand[1],somehand[3],somehand[4],somehand[5]]
        subdeckdict4to6["sixdeck15"] = [somehand[2],somehand[3],somehand[4],somehand[5]]
        
        return subdeckdict4to6
    }
    
    func makeSubDecksOf2From4(somehand: [Card]) -> [String: [Card]] {
        var subdeckdict4to2 = ["twofourdeck1": [somehand[0],somehand[1]]]
        subdeckdict4to2["twofourdeck2"] = [somehand[0], somehand[2]]
        subdeckdict4to2["twofourdeck3"] = [somehand[0], somehand[3]]
        subdeckdict4to2["twofourdeck4"] = [somehand[1], somehand[2]]
        subdeckdict4to2["twofourdeck5"] = [somehand[1], somehand[3]]
        subdeckdict4to2["twofourdeck6"] = [somehand[2], somehand[3]]
        
        return subdeckdict4to2
    }
    
    func makeSubDecksOf3From4(somehand: [Card]) -> [String: [Card]] {
        var subdeckdict4to3 = ["threefourdeck1": [somehand[0], somehand[1], somehand[2]]]
        subdeckdict4to3["threefourdeck2"] = [somehand[0], somehand[1], somehand[3]]
        subdeckdict4to3["threefourdeck3"] = [somehand[0], somehand[2], somehand[3]]
        subdeckdict4to3["threefourdeck4"] = [somehand[1], somehand[2], somehand[3]]
        
        return subdeckdict4to3
    }
    

    func jackinhand(somehand: [Card]) -> Int {
        var count = 0
        for acard in somehand {
            if acard.rank.description() == "jack" && acard.suit.description() == CribbageDeck().getCutCardCard().suit.description() {
                count += 1
            }
        }
        return count
    }
    
    func SomeOfAKind(ahand: [Card]) -> Int {
        var count = 0
        let twodict = makeSubDecksOf2From4(ahand)
        let threedict = makeSubDecksOf3From4(ahand)
        
        for (_, value) in twodict {
            if value[0].rank.ordinal() == value[1].rank.ordinal() {
                count += 2
            }
        }
        
        for (_, value) in threedict {
            if value[0].rank.ordinal() == value[1].rank.ordinal() && value[1].rank.ordinal() == value[2].rank.ordinal() {
                count += 4
            }
        }
        
        if ahand[0].rank.ordinal() == ahand[1].rank.ordinal() && ahand[1].rank.ordinal() == ahand[2].rank.ordinal() && ahand[2].rank.ordinal() == ahand[3].rank.ordinal() {
            count += 6
        }
        
        return count
    }
    
    func fifteencount(ahand: [Card]) -> Int {
        var count = 0
        let twodict = makeSubDecksOf2From4(ahand)
        let threedict = makeSubDecksOf3From4(ahand)
        
        for (_, value) in twodict {
            if value[0].rank.value() + value[1].rank.value() == 15 {
                count += 2
            }
        }
        
        for (_, value) in threedict {
            if value[0].rank.value() + value[1].rank.value() + value[2].rank.value() == 15 {
                count += 2
            }
        }
        
        if ahand[0].rank.value() + ahand[1].rank.value() + ahand[2].rank.value() +  ahand[3].rank.value() == 15 {
            count += 2
        }
        
        return count
    }
    
    func straight(ahand: [Card]) -> Int{
        var count = 0
        let threedict = makeSubDecksOf3From4(ahand)
        let sorthand = ahand.sort { $0.rank.ordinal() < $1.rank.ordinal() }
        
        print("straight check 6 \(sorthand)")
        if sorthand[0].rank.ordinal() == sorthand[1].rank.ordinal() - 1 && sorthand[1].rank.ordinal() == sorthand[2].rank.ordinal() - 1 && sorthand[2].rank.ordinal() == sorthand[3].rank.ordinal() - 1 {
            count += 4
                
            return count
        }
        
        if count == 0 {
            for (_, value) in threedict {
                let sorthand = value.sort { $0.rank.ordinal() < $1.rank.ordinal() }
                print("straight check 7 \(sorthand)")

                if sorthand[0].rank.ordinal() == sorthand[1].rank.ordinal() - 1 && sorthand[1].rank.ordinal() == sorthand[2].rank.ordinal() - 1 {
                    count += 3
                }
            }
        }
        
        return count
    }
    
    func fourflush(justplayerhand: [Card]) -> Int {
        var count = 0
        let suitchecker = justplayerhand[0].suit.description()
        for acard in justplayerhand {
            if acard.suit.description() == suitchecker {
                count = justplayerhand.count
            } else {
                return 0
            }
        }
        
        return count
    }
}
