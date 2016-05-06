//
//  ViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 3/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {
    
    func switchturn() -> Bool {
        Constants.computerturn = !Constants.computerturn
        return Constants.computerturn
    }
    
    //MARK: - Outlets

    @IBAction func Next(sender: UIButton) {
        if CribbageDeck().cpuHandLength() == 0 {
            performSegueWithIdentifier("RunToCards", sender: sender)
        } else if Constants.computerturn {
            (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
            
            lastCard.image = UIImage(named: Constants.imagestring)
            switchturn()
            
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                //change mark to end/repeat next player's turn
                
            }
        }
    }
    
    @IBOutlet weak var PlayerScore: UILabel! { didSet {
        PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
        }
    }
    @IBOutlet weak var CPUScore: UILabel! { didSet {
        CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
        }
    }
    @IBOutlet weak var dealer: UILabel! { didSet {
        dealer.text = "Dealer: \(CribbageDeck().whoDealtIt())"
        }
    }
    
    @IBOutlet weak var lastCard: UIImageView! { didSet {
        lastCard.image = UIImage(named: Constants.lastcard)
        print("lastcard \(Constants.lastcard)")
        updateUI()
        }
    }
    
    @IBOutlet weak var cutCard: UIImageView! { didSet {
        cutCard.image = UIImage(named: Constants.cutcard)
        print("cutcard \(Constants.cutcard)")
        }
    }
    
    @IBOutlet weak var Hand1: UIImageView! { didSet {
        self.Hand1.userInteractionEnabled = true
        Hand1.image = UIImage(named: Constants.c1)
        print("Hand1 \(Constants.c1)")
        }
    }
    
    @IBOutlet weak var Hand2: UIImageView! {
        didSet {
            self.Hand2.userInteractionEnabled = true
            Hand2.image = UIImage(named: Constants.c2)
            print("Hand2 \(Constants.c2)")
        }
    }
    
    @IBOutlet weak var Hand3: UIImageView! {
        didSet {
            self.Hand3.userInteractionEnabled = true
            Hand3.image = UIImage(named: Constants.c3)
            print("Hand3 \(Constants.c3)")
        }
    }
    
    @IBOutlet weak var Hand4: UIImageView! {
        didSet {
            self.Hand4.userInteractionEnabled = true
            Hand4.image = UIImage(named: Constants.c4)
            print("Hand4 \(Constants.c4)")
        }
    }
    
    @IBOutlet weak var Hand5: UIImageView! {
        didSet {
            self.Hand5.userInteractionEnabled = true
            Hand5.image = UIImage(named: Constants.c5)
            print("Hand5 \(Constants.c5)")
        }
    }
    
    @IBOutlet weak var Hand6: UIImageView! {
        didSet {
            self.Hand6.userInteractionEnabled = true
            Hand6.image = UIImage(named: Constants.c6)
            print("Hand6 \(Constants.c6)")
        }
    }
    
    func updateUI() {
        if lastCard != nil {
            lastCard.image = UIImage(named: Constants.lastcard)
        }
    }
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastCard.image = UIImage(named:Constants.lastcard)
        Constants.crib = 0
        Constants.playercount = 2
        updateUI()
        //Do any additional setup after loading the view.
    }
    
    // MARK: - Card Taps
    
    @IBAction func Card1Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c1)
            
            Constants.crib += 1
            Hand1.image = nil
            Hand1.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                Constants.playercount += 1

                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                
                
                Hand1.image = UIImage(named: "bicycleback")
            
                Constants.dictofscores = CribbageDeck().play(Constants.c1)
                lastCardDisplay(Constants.c1)
                Hand1.userInteractionEnabled = false
                
                switchturn()
            }
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                
                //change mark to end/repeat next player's turn
                
                
            }
            
            if Constants.dictofscores["Player"] != Constants.currentplayerscore {
                print(Constants.currentplayerscore)
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }
    
    @IBAction func Card2Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c2)
            
            Constants.crib += 1
            Hand2.image = nil
            Hand2.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                //Change the score after playing the card!!!
                
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                
                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                Constants.playercount += 1
                
                Hand2.image = UIImage(named: "bicycleback")
                
                Constants.dictofscores = CribbageDeck().play(Constants.c2)
                lastCardDisplay(Constants.c2)
                Hand2.userInteractionEnabled = false
                
                switchturn()
            }
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                
                //change mark to end/repeat next player's turn
                
                
            }
            if Constants.dictofscores["Player"] != Constants.currentplayerscore {
                print(Constants.currentplayerscore)
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }
    
    @IBAction func Card3Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c3)
            
            Constants.crib += 1
            Hand3.image = nil
            Hand3.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                
                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                Constants.playercount += 1
                
                Hand3.image = UIImage(named: "bicycleback")
                
                Constants.dictofscores = CribbageDeck().play(Constants.c3)
                lastCardDisplay(Constants.c3)
                Hand3.userInteractionEnabled = false
                
                switchturn()
            }
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                
                //change mark to end/repeat next player's turn
                
                
            }
            if Constants.dictofscores["Player"] != Constants.currentplayerscore {
                print(Constants.currentplayerscore)
                for (key, value) in Constants.dictofscores {
                    print(key, value)
                }
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }
    
    @IBAction func Card4Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c4)
            
            Constants.crib += 1
            Hand4.image = nil
            Hand4.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                
                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                
                Constants.playercount += 1

                Hand4.image = UIImage(named: "bicycleback")
                
                Constants.dictofscores = CribbageDeck().play(Constants.c4)
                lastCardDisplay(Constants.c4)
                Hand4.userInteractionEnabled = false
                

                switchturn()
            }
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                
                //change mark to end/repeat next player's turn
                
                
            }
            if Constants.dictofscores["Player"] != Constants.currentplayerscore
            {
                print(Constants.currentplayerscore)
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }
    
    @IBAction func Card5Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c5)
            
            Constants.crib += 1
            Hand5.image = nil
            Hand5.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                
                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                
                Constants.playercount += 1

                Hand5.image = UIImage(named: "bicycleback")
                
                Constants.dictofscores = CribbageDeck().play(Constants.c5)
                lastCardDisplay(Constants.c5)
                Hand5.userInteractionEnabled = false
                
                switchturn()
            }
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
                
                
                //change mark to end/repeat next player's turn
                
                
            }
            if Constants.dictofscores["Player"] != Constants.currentplayerscore {
                print(Constants.currentplayerscore)
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }

    @IBAction func Card6Tap(sender: UITapGestureRecognizer) {
        
        if Constants.crib <= 1 {
            CribbageDeck().addToCrib(Constants.c6)
            
            Constants.crib += 1
            Hand6.image = nil
            Hand6.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            if Constants.computerturn {
                
                
                //NEED TO WORK ON THIS PART STILL?
                
                (Constants.imagestring, Constants.dictofscores) = CribbageDeck().computerPlay()
                
                lastCard.image = UIImage(named: Constants.imagestring)
                switchturn()
            } else {
                
                
                //MAKE SURE ALL OF THE OTHER CARDTAPs match this
                Constants.playercount += 1
                
                Hand6.image = UIImage(named: "bicycleback")
                
                Constants.dictofscores = CribbageDeck().play(Constants.c6)
                lastCardDisplay(Constants.c6)
                Hand6.userInteractionEnabled = false
                

                switchturn()
            }
            
            if Constants.dictofscores["Computer"] != Constants.currentcpuscore {
                Constants.currentcpuscore += Constants.dictofscores["Computer"]!
                CPUScore.text = "CPU Score: \(Constants.currentcpuscore)"
            }
            if Constants.dictofscores["Player"] != Constants.currentplayerscore {
                print(Constants.currentplayerscore)
                print(Constants.dictofscores["Player"]!)
                Constants.currentplayerscore += Constants.dictofscores["Player"]!
                PlayerScore.text = "Player Score: \(Constants.currentplayerscore)"
            }
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static var cutcard = "bicycleback"
        static var lastcard = "bicycleback"
        static var c1 = "bicycleback"
        static var c2 = "bicycleback"
        static var c3 = "bicycleback"
        static var c4 = "bicycleback"
        static var c5 = "bicycleback"
        static var c6 = "bicycleback"
        
        static var crib = 0
        
        static var computerturn = false
        
        static var currentplayerscore = 0
        static var currentcpuscore = 0
        static var playercango = true
        static var computercango = true
        static var playercount = 0
        
        static var dictofscores = ["":0]
        static var imagestring = ""
    }
    
    // MARK: - Card Displays
    
    func lastCardDisplay(card: String) -> String {
        Constants.lastcard = card
        print("sample lastcard \(Constants.lastcard)")
        updateUI()
        return Constants.lastcard
    }
    
    func cutCardDisplay() -> String {
        if Constants.crib >= 1 {
            Constants.cutcard = CribbageDeck().cutcard().description()
            print("sample cutcard \(Constants.cutcard)")

        }
        return Constants.cutcard
    }
    
    func c1Display(card: String) -> String {
        Constants.c1 = card
        print("c1 \(Constants.c1)")
        return Constants.c1
    }
    
    func c2Display(card: String) -> String {
        Constants.c2 = card
        print("c2 \(Constants.c2)")
        return Constants.c2
    }
    
    func c3Display(card: String) -> String {
        Constants.c3 = card
        print("c3 \(Constants.c3)")
        return Constants.c3
    }
    
    func c4Display(card: String) -> String {
        Constants.c4 = card
        print("c4 \(Constants.c4)")
        return Constants.c4
    }
    
    func c5Display(card: String) -> String {
        Constants.c5 = card
        print("c5 \(Constants.c5)")
        return Constants.c5
    }
    
    func c6Display(card: String) -> String {
        Constants.c6 = card
        print("c6 \(Constants.c6)")
        return Constants.c6
    }
    
    // MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
     // MARK: - Navigation
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Pass the selected object to the new view controller.
     }
     
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "RunToCards" {
            print("1\(Constants.playercount)")
            print("2\(CribbageDeck().cpuHandLength())")
            if CribbageDeck().cpuHandLength() == 0 && Constants.playercount == 6 {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
}