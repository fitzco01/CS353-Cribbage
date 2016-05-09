//
//  ViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 3/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {
    
    func updateUI() {
        if lastCard != nil {
            lastCard.image = UIImage(named: Constants.lastcard)
        }
    }
    
    func setBackground() {
        if backgroundImage != nil {
            backgroundImage.image = UIImage(named: SettingsViewController().pickedBackground())
        }
    }
    
    func setCard() {
        Constants.cardback = SettingsViewController().pickedCard()
    }
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        backgroundImage.image = UIImage(named: Constants.background)
        setBackground()
        setCard()
        Constants.lastcard = Constants.cardback
        print("FUCK \(Constants.lastcard)")
        Constants.cutcard = Constants.cardback
        lastCard.image = UIImage(named: Constants.lastcard)
        cutCard.image = UIImage(named: Constants.cutcard)
        Constants.crib = 0
        Constants.playercount = 2
        Constants.computercango = true
        Constants.playercango = true
        updateUI()
        super.viewDidLoad()
        //Do any additional setup after loading the view.
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static var cardback = "LutherCard"
        static var background = "Wood"
        static var cutcard = Constants.cardback
        static var lastcard = Constants.cardback
        static var c1 = Constants.cardback
        static var c2 = Constants.cardback
        static var c3 = Constants.cardback
        static var c4 = Constants.cardback
        static var c5 = Constants.cardback
        static var c6 = Constants.cardback
        static var didntplay = false
        static var crib = 0
        static var computerturn = true
        static var playercango = true
        static var computercango = true
        static var playercount = 0
        static var imagestring = ""
        static var pause = false
        static var cardOptions = [""]
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: Constants.background)
        }
    }

    @IBAction func Next(sender: UIButton) {
        if CribbageDeck().cpuHandLength() == 0 {
            (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
            if !Constants.computercango {
                if ScoringRun().getruncount() != 31 {
                    ScoringRun().lastcard(History().mostRecentPlayer().name)
                    PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                }
                print("deleting history 3")
                History().deleteHistory()
                lastCard.image = UIImage(named: Constants.cardback)
                print("TURN 5 \(Constants.computerturn)")
                ScoringRun().resetruncount()
            }
            
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
            
            Constants.pause = false
            performSegueWithIdentifier("RunToCards", sender: sender)
            
        } else if Constants.computerturn {
            (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
            if !Constants.computercango {
                if ScoringRun().getruncount() != 31 {
                    ScoringRun().lastcard(History().mostRecentPlayer().name)
                    PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                }
                print("deleting history 3")
                History().deleteHistory()
                lastCard.image = UIImage(named: Constants.cardback)
                print("TURN 5 \(Constants.computerturn)")
                ScoringRun().resetruncount()
            } else {
                print("YOU GOT HERE")
                Constants.imagestring = CribbageDeck().computerPlay()
            
                lastCard.image = UIImage(named: Constants.imagestring)
                Constants.pause = true
            
                switchturn()
            }
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        }
    }
    
    @IBOutlet weak var PlayerScore: UILabel! { didSet {
        PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        }
    }
    @IBOutlet weak var CPUScore: UILabel! { didSet {
        CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
        }
    }
    @IBOutlet weak var dealer: UILabel! { didSet {
        dealer.text = "Dealer: \(CribbageDeck().whoDealtIt())"
        }
    }
    
    @IBOutlet weak var lastCard: UIImageView! { didSet {
        lastCard.image = UIImage(named: Constants.lastcard)
        updateUI()
        }
    }
    
    @IBOutlet weak var cutCard: UIImageView! { didSet {
        cutCard.image = UIImage(named: Constants.cardback)
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
    
    func switchturn() -> Bool {
        Constants.computerturn = !Constants.computerturn
        return Constants.computerturn
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
            print("ERROR WITH TAPS")
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
                
                (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
                if Constants.computercango {
                    Constants.imagestring = CribbageDeck().computerPlay()
                    
                    lastCard.image = UIImage(named: Constants.imagestring)
                    print("TURN 1 \(Constants.computerturn)")
                    switchturn()
                } else {
                    (_, Constants.playercango) = CribbageDeck().canPlay("Player")
                    if Constants.playercango {
                        switchturn()
                    } else {
                        if ScoringRun().getruncount() != 31 {
                            ScoringRun().lastcard(History().mostRecentPlayer().name)
                            PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        }
                        print("deleting history 1")
                        History().deleteHistory()
                        lastCard.image = UIImage(named: Constants.cardback)
                        print("TURN 2 \(Constants.computerturn)")
                        ScoringRun().resetruncount()
                    }
                }
            } else {
                (Constants.cardOptions, Constants.playercango) = CribbageDeck().canPlay("Player")
                if Constants.playercango {
                    
                    Constants.playercount += 1
                    print(Constants.cardOptions)
                    print(cardname)
                    print(!Constants.cardOptions.contains(cardname))
                    if !Constants.cardOptions.contains(cardname) && CribbageDeck().cpuHandLength() != 0 {
                        whichHand.userInteractionEnabled = false
                        Constants.didntplay = true
                    } else {
                    
                        whichHand.image = UIImage(named: Constants.cardback)
                    
                        CribbageDeck().play(cardname)
                        lastCardDisplay(cardname)
                        whichHand.userInteractionEnabled = false
                        print("TURN 3 \(Constants.computerturn)")
                        switchturn()
                    }
                } else {
                    (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
                    if Constants.computercango {
                        print("TURN 4 \(Constants.computerturn)")

                        switchturn()
                    } else {
                        if ScoringRun().getruncount() != 31 {
                            ScoringRun().lastcard(History().mostRecentPlayer().name)
                            PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        }
                        print("deleting history 2")
                        History().deleteHistory()
                        lastCard.image = UIImage(named: Constants.cardback)
                        print("TURN 5 \(Constants.computerturn)")
                        ScoringRun().resetruncount()
                    }
                }
            }
            if Constants.didntplay {
                whichHand.userInteractionEnabled = true
                Constants.didntplay = false
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "RunToFinal" {
            if PlayerScores().winner("Player") || PlayerScores().winner("Computer") {
                return true
            } else {
                return false
            }
        }
        else if identifier == "RunToCards" {
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