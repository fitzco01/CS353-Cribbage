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
            Constants.pause = false
            performSegueWithIdentifier("RunToCards", sender: sender)
        } else if Constants.computerturn {
            Constants.imagestring = CribbageDeck().computerPlay()
            
            lastCard.image = UIImage(named: Constants.imagestring)
            Constants.pause = true
            
            switchturn()

            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
        }
    }
    
    @IBOutlet weak var PlayerScore: UILabel! { didSet {
        PlayerScore.text = "Player Score: 0"
        }
    }
    @IBOutlet weak var CPUScore: UILabel! { didSet {
        CPUScore.text = "CPU Score: 0"
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
        cutCard.image = UIImage(named: "bicycleback")
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
    
    func forTheCardTaps(whichHand: UIImageView!, whichTap: Int) {
        var cardname = ""
        switch whichTap {
        case 1:
            cardname = Constants.c1
        case 2:
            cardname = Constants.c2
        case 3:
            cardname = Constants.c3
        case 4:
            cardname = Constants.c4
        case 5:
            cardname = Constants.c5
        case 6:
            cardname = Constants.c6
        default:
            print("ERROR WITH whichTap")
        }
        
        if Constants.crib <= 1 {
            
            CribbageDeck().removeCardFromPlayer(cardname)
            CribbageDeck().removeCardFromPlayerShortHand(cardname)
            
            Constants.crib += 1
            whichHand.image = nil
            whichHand.userInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            cutCard.image = UIImage(named: CribbageDeck().getCutCard())
            if Constants.computerturn {
                
                Constants.computercango = CribbageDeck().canPlay("Computer")
                if Constants.computercango {
                    Constants.imagestring = CribbageDeck().computerPlay()
                    
                    lastCard.image = UIImage(named: Constants.imagestring)
                    switchturn()
                } else {
                    Constants.playercango = CribbageDeck().canPlay("Player")
                    if Constants.playercango {
                        switchturn()
                    } else {
                        ScoringRun().lastcard(History().mostRecentPlayer().name)
                        PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        
                        History().deleteHistory()
                        lastCard.image = UIImage(named: "bicycleback")
                        
                        switchturn()
                    }
                }
            } else {
                Constants.playercango = CribbageDeck().canPlay("Player")
                if Constants.playercango {
                    
                    Constants.playercount += 1
                    
                    whichHand.image = UIImage(named: "bicycleback")
                    
                    CribbageDeck().play(cardname)
                    lastCardDisplay(cardname)
                    whichHand.userInteractionEnabled = false
                    
                    switchturn()
                } else {
                    Constants.computercango = CribbageDeck().canPlay("Computer")
                    if Constants.computercango {
                        switchturn()
                    } else {
                        ScoringRun().lastcard(History().mostRecentPlayer().name)
                        PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        
                        History().deleteHistory()
                        print("LAST CARD0")
                        lastCard.image = UIImage(named: "bicycleback")
                        
                        switchturn()
                    }
                }
            }
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        }
    }
    
    @IBAction func Card1Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand1, whichTap: 1)
    }
    
    @IBAction func Card2Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand2, whichTap: 2)
    }
    
    @IBAction func Card3Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand3, whichTap: 3)

    }
    
    @IBAction func Card4Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand4, whichTap: 4)
    }
    
    @IBAction func Card5Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand5, whichTap: 5)
    }

    @IBAction func Card6Tap(sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand6, whichTap: 6)
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
        
        static var playercango = true
        static var computercango = true
        static var playercount = 0
        
        static var imagestring = ""
        static var pause = false
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
            Constants.cutcard = CribbageDeck().getCutCard()
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
    
    //add in a delay when the computer is the last one to play!!!
     
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "RunToCards" {
            if CribbageDeck().cpuHandLength() == 0 && Constants.playercount == 6 && !Constants.pause {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
}