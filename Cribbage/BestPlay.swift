//
//  BestPlay.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/1/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class BestPlay {
    
    private struct Constants {
        static var count = 0
        static var newcount = 0
        static var keystring = ""
        static var newCardCount = 0
        static var oldCardCount = 0
        static var pickedCard = Card(rank: .king, suit: .clubs)
    }
    
    
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
    
    func pickACard(cpuhand: [Card]) -> (Card, [Card])? {
        
        print("HERE 1")
        
        let H = History()
        let C = CPUScoringRun()
        
        var tempcard: Card = cpuhand[0]
    
        var remainingcards: [Card] = []
        
        for acard in cpuhand {
            Constants.newCardCount = 0
            
            if H.playLength() == 0 {
                
                Constants.newCardCount += C.fifteencount(acard)
                Constants.newCardCount += C.SomeOfAKind(acard)
                Constants.newCardCount += C.straight(acard)
                
                print("HERE 3")
            }
            
            if Constants.newCardCount >= Constants.oldCardCount {
                    
                tempcard = acard
                Constants.oldCardCount = Constants.newCardCount
                index = loopcount
                    
                print("HERE 4")

            
            } else {
                
                print("HERE 5")

                if acard.rank.value() + ScoringRun().getruncount() <= 31 {
                    Constants.newCardCount += C.fifteencount(acard)
                    Constants.newCardCount += C.SomeOfAKind(acard)
                    Constants.newCardCount += C.straight(acard)
                    
                    print("HERE 6")
                
                    if tempcount >= Constants.runcount {
                        tempcard = acard
                        
                        print("HERE 7")
                        
                        Constants.runcount = tempcount
                        index = loopcount
                    }
                } else {
                    //add exception handling!!!
                }
                
                loopcount += 1
            }
        }
        
        for acard in cpuhand {
            if loopcount2 != index {
                
                print("HERE 8")

                remainingcards.append(acard)
            }
            loopcount2 += 1
        }
        
        print("HERE 9")

        return (tempcard, remainingcards)
    }
    
}