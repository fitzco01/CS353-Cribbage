//
//  ViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 3/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Hand View Controller

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
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        backgroundImage.image = UIImage(named: Constants.background)
        setBackground()
        setCard()
        Constants.lastcard = Constants.cardback
        Constants.cutcard = Constants.cardback
        lastCard.image = UIImage(named: Constants.lastcard)
        cutCard.image = UIImage(named: Constants.cutcard)
        Constants.crib = 0
        Constants.playercount = 2
        Constants.computercango = true
        Constants.playercango = true
        Constants.playerwent = false
        let turn = CribbageDeck().whoDealtIt()
        if turn == "Computer" {
            Constants.computerturn = false
        } else if turn == "Player" {
            Constants.computerturn = true
        }
        updateUI()
        super.viewDidLoad()
        //Do any additional setup after loading the view.
    }
    
    //MARK: - Constants
    
    fileprivate struct Constants {
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
        static var playerwent = false
        static var done = false
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: Constants.background)
        }
    }

    @IBAction func Next(_ sender: UIButton) {
        if CribbageDeck().cpuHandLength() == 0 {
            (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
            if !Constants.computercango {
                if ScoringRun().getruncount() != 31 {
                    ScoringRun().lastcard(History().mostRecentPlayer().name)
                    PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                }
                History().deleteHistory()
                lastCard.image = UIImage(named: Constants.cardback)
                ScoringRun().resetruncount()
            }
            
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
            
            Constants.pause = false
            performSegue(withIdentifier: "RunToCards", sender: sender)
            
        } else if Constants.computerturn || !Constants.playercango || CribbageDeck().showPlayerHand().count == 0 {
            if !Constants.playercango {
                Constants.computerturn = true
            }
            if History().showPlayHistory().count == 0 || History().showPlayHistory().count == 1 || Constants.playerwent || CribbageDeck().showPlayerHand().count == 0 {
                (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
                if !Constants.computercango {
                    if ScoringRun().getruncount() != 31 {
                        ScoringRun().lastcard(History().mostRecentPlayer().name)
                        PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                    }
                    History().deleteHistory()
                    lastCard.image = UIImage(named: Constants.cardback)
                    ScoringRun().resetruncount()
                } else {
                    (Constants.imagestring, Constants.done) = CribbageDeck().computerPlay()
                    if Constants.done {
                        performSegue(withIdentifier: "RunToFinal", sender: self)
                    }
                    
                    lastCard.image = UIImage(named: Constants.imagestring)
                    Constants.pause = true
                    
                    switchturn()
                }
            } else {
                print("COMPUTER CAN'T GO")
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
        self.Hand1.isUserInteractionEnabled = true
        Hand1.image = UIImage(named: Constants.c1)
        }
    }
    
    @IBOutlet weak var Hand2: UIImageView! {
        didSet {
            self.Hand2.isUserInteractionEnabled = true
            Hand2.image = UIImage(named: Constants.c2)
        }
    }
    
    @IBOutlet weak var Hand3: UIImageView! {
        didSet {
            self.Hand3.isUserInteractionEnabled = true
            Hand3.image = UIImage(named: Constants.c3)
        }
    }
    
    @IBOutlet weak var Hand4: UIImageView! {
        didSet {
            self.Hand4.isUserInteractionEnabled = true
            Hand4.image = UIImage(named: Constants.c4)
        }
    }
    
    @IBOutlet weak var Hand5: UIImageView! {
        didSet {
            self.Hand5.isUserInteractionEnabled = true
            Hand5.image = UIImage(named: Constants.c5)
        }
    }
    
    @IBOutlet weak var Hand6: UIImageView! {
        didSet {
            self.Hand6.isUserInteractionEnabled = true
            Hand6.image = UIImage(named: Constants.c6)
        }
    }
    
    func switchturn() -> Bool {
        Constants.computerturn = !Constants.computerturn
        return Constants.computerturn
    }
    
    @IBAction func Card1Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand1, whichTap: 1)
    }
    
    @IBAction func Card2Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand2, whichTap: 2)
    }
    
    @IBAction func Card3Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand3, whichTap: 3)

    }
    
    @IBAction func Card4Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand4, whichTap: 4)
    }
    
    @IBAction func Card5Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand5, whichTap: 5)
    }

    @IBAction func Card6Tap(_ sender: UITapGestureRecognizer) {
        forTheCardTaps(Hand6, whichTap: 6)
    }
    
    //MARK: - Card Taps
    
    func forTheCardTaps(_ whichHand: UIImageView!, whichTap: Int) {
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
            Constants.playerwent = true
            
            Constants.crib += 1
            whichHand.image = nil
            whichHand.isUserInteractionEnabled = false
            if Constants.crib == 2 {
                cutCardDisplay()
            }
        } else {
            cutCard.image = UIImage(named: CribbageDeck().getCutCard())
            if Constants.computerturn {
                
                (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
                if Constants.computercango {
                    (Constants.imagestring, Constants.done) = CribbageDeck().computerPlay()
                    if Constants.done {
                        performSegue(withIdentifier: "RunToFinal", sender: self)
                    }
                    
                    lastCard.image = UIImage(named: Constants.imagestring)
                    switchturn()
                } else {
                    (_, Constants.playercango) = CribbageDeck().canPlay("Player")
                    if Constants.playercango {
                        switchturn()
                    } else {
                        if ScoringRun().getruncount() != 31 || (CribbageDeck().cpuHandLength() == 0 && CribbageDeck().showPlayerHand().count == 0) {
                            ScoringRun().lastcard(History().mostRecentPlayer().name)
                            PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        }
                        History().deleteHistory()
                        lastCard.image = UIImage(named: Constants.cardback)
                        ScoringRun().resetruncount()
                    }
                }
            } else {
                (Constants.cardOptions, Constants.playercango) = CribbageDeck().canPlay("Player")
                if Constants.playercango {
                    
                    Constants.playercount += 1
                    if !Constants.cardOptions.contains(cardname) && CribbageDeck().cpuHandLength() != 0 {
                        whichHand.isUserInteractionEnabled = false
                        Constants.didntplay = true
                    } else {
                        
                        whichHand.image = UIImage(named: Constants.cardback)
                        
                        Constants.done = CribbageDeck().play(cardname)
                        if Constants.done {
                            performSegue(withIdentifier: "RunToFinal", sender: self)
                        }
                        lastCardDisplay(cardname)
                        whichHand.isUserInteractionEnabled = false
                        Constants.playerwent = true
                        switchturn()
                    }
                } else {
                    (_, Constants.computercango) = CribbageDeck().canPlay("Computer")
                    if Constants.computercango {
                        
                        switchturn()
                    } else {
                        if ScoringRun().getruncount() != 31 || (CribbageDeck().cpuHandLength() == 0 && CribbageDeck().showPlayerHand().count == 0) {
                            ScoringRun().lastcard(History().mostRecentPlayer().name)
                            PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
                        }
                        History().deleteHistory()
                        lastCard.image = UIImage(named: Constants.cardback)
                        ScoringRun().resetruncount()
                    }
                }
            }
            if Constants.didntplay {
                whichHand.isUserInteractionEnabled = true
                Constants.didntplay = false
            }
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        }
    }
    
    //MARK: - Card Displays
    
    func lastCardDisplay(_ card: String) -> String {
        Constants.lastcard = card
        updateUI()
        return Constants.lastcard
    }
    
    func cutCardDisplay() -> String {
        if Constants.crib >= 1 {
            Constants.cutcard = CribbageDeck().getCutCard()
        }
        return Constants.cutcard
    }
    
    func c1Display(_ card: String) -> String {
        Constants.c1 = card
        return Constants.c1
    }
    
    func c2Display(_ card: String) -> String {
        Constants.c2 = card
        return Constants.c2
    }
    
    func c3Display(_ card: String) -> String {
        Constants.c3 = card
        return Constants.c3
    }
    
    func c4Display(_ card: String) -> String {
        Constants.c4 = card
        return Constants.c4
    }
    
    func c5Display(_ card: String) -> String {
        Constants.c5 = card
        return Constants.c5
    }
    
    func c6Display(_ card: String) -> String {
        Constants.c6 = card
        return Constants.c6
    }
    
    //MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Navigation
    //MARK: - Segue
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - Should Perform Segue
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
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
