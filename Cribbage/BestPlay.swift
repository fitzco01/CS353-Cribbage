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
        
        static var runcount = 0
    }
    
    //returns a dictionary with two elements
    //one is the [new computer cards (its hand)] (key = "Computer Hand")
    //the other is the [crib cards] (key = "Crib Cards")
    
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
        let H = History()
        let C = CPUScoringRun()
        
        var tempcard: Card = cpuhand[0]
        var loopcount = 0
        var loopcount2 = 0
        Constants.runcount = 0
        var remainingcards: [Card] = []
        var index = 0
        
        print("COMPUTER HAND \n \(cpuhand) \n")
        
        for acard in cpuhand {
            var tempcount = 0
            
            if H.playLength() == 0 {
                
                tempcount += C.fifteencount(acard)
                tempcount += C.SomeOfAKind(acard)
                tempcount += C.straight(acard)
                
                if tempcount >= Constants.runcount {
                    
                    tempcard = acard
                    Constants.runcount = tempcount
                    index = loopcount
                }
            } else {
                if acard.rank.rawValue + H.mostRecentPlay().rank.rawValue <= 31 {
                    tempcount += C.fifteencount(acard)
                    tempcount += C.SomeOfAKind(acard)
                    tempcount += C.straight(acard)
                
                    if tempcount >= Constants.runcount {
                        tempcard = acard
                                        
                        Constants.runcount = tempcount
                        index = loopcount
                    }
                }
                loopcount += 1
            }
        }
        
        for acard in cpuhand {
            if loopcount2 != index {
                remainingcards.append(acard)
            }
            loopcount2 += 1
        }
        
        print("SELECTITSCARD \(tempcard)")
        return (tempcard, remainingcards)
    }
    
}