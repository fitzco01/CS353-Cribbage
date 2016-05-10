//
//  BestPlay.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/1/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//MARK: - Bestplay

class BestPlay {
    
    //MARK: - Constants
    
    private struct Constants {
        static var count = 0
        static var newcount = 0
        static var keystring = ""
        static var newCardValue = 0
        static var oldCardValue = 0
    }
    
    //MARK: - Best Hand
    
    func createAHand(computerhand: [Card]) -> [String : [Card]] {
        let S = CPUScoringHand()
        let fourdict = S.makeSubDecksOf4From6(computerhand)
        
        var thisdict = ["": [String:[Card]]()]
        
        var cribcards = computerhand
        
        for (key, value) in fourdict {
            Constants.count += S.fifteencount(value)
            Constants.count += S.fourflush(value)
            Constants.count += S.SomeOfAKind(value)
            Constants.count += S.straight(value)
            
            if Constants.count >= Constants.newcount {
                thisdict["THIS DICT"] = [key:value]
                Constants.keystring = key
            }
            
            Constants.newcount = Constants.count
        }
        
        let ad = thisdict["THIS DICT"]!
        let newhand = ad[Constants.keystring]!

        var pos = 0
        for acard in newhand {
            for bcard in cribcards {
                if acard.description() == bcard.description() {
                    cribcards.removeAtIndex(pos)
                }
                pos += 1
            }
            pos = 0
        }
        
        var finaldict = [String: [Card]]()
        finaldict["Computer Hand"] = newhand
        finaldict["Crib Cards"] = cribcards
                
        return finaldict
    }
    
    //MARK: - Best Card
    
    func pickACard(cpuhand: [Card]) -> (Card, [Card])? {
        
        let C = CPUScoringRun()
        
        var finalcard: Card = cpuhand[0]
    
        var remainingcards = cpuhand
        
        
        if History().playLength() != 0 {
            for acard in cpuhand {
                if acard.rank.value() + ScoringRun().getruncount() <= 31 {
                    C.addcard(acard)
                    Constants.newCardValue += C.fifteencount(acard)
                    Constants.newCardValue += C.SomeOfAKind(acard)
                    Constants.newCardValue += C.straight(acard)
                    
                    if Constants.newCardValue >= Constants.oldCardValue {
                    
                        finalcard = acard
                        Constants.oldCardValue = Constants.newCardValue
                    }
                } else {
                    print("Computer's card denied")
                }
            }
        }
        
        remainingcards.removeAll()
        for acard in cpuhand {
            if acard.description() != finalcard.description() {
                remainingcards.append(acard)
            }
        }
        
        return (finalcard, remainingcards)
    }
}