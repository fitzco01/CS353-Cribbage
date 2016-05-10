//
//  CardsViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/3/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Cards View Controller

class CardsViewController: UIViewController {
    
    //MARK: - Outlets

    @IBAction func Next(sender: UIButton) {
        if Constants.computerdidgo && Constants.playerdidgo {
            performSegueWithIdentifier("CardsToCrib", sender: sender)
        }
        if Constants.done {
            performSegueWithIdentifier("CardsToFinal", sender: self)
        }
    }
    @IBOutlet weak var Dealer: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: "Wood")
        }
    }
    
    @IBOutlet weak var whoScored: UILabel!
    @IBOutlet weak var CPUScore: UILabel!
    @IBOutlet weak var PlayerScore: UILabel!
    
    @IBOutlet weak var CutCard: UIImageView!
    @IBOutlet weak var Card1: UIImageView!
    @IBOutlet weak var Card2: UIImageView!
    @IBOutlet weak var Card3: UIImageView!
    @IBOutlet weak var Card4: UIImageView!
    
    private struct Constants {
        static var playerdidgo = false
        static var computerdidgo = false
        static var done = false
    }
    
    //MARK: - Background
    
    func setBackground() {
        if backgroundImage != nil {
            backgroundImage.image = UIImage(named: SettingsViewController().pickedBackground())
        }
    }
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Wood")
        setBackground()
        
        if History().playLength() != 0 {
            if ScoringRun().getruncount() != 31 {
                ScoringRun().lastcard(History().mostRecentPlayer().name)
                PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
            }
            History().deleteHistory()
            ScoringRun().resetruncount()
        }
        

        let firstplayername = CribbageDeck().whoDidntDealIt()
        
        if firstplayername == "Player" {
            let (p1,p2,p3,p4) = CribbageDeck().hand("Player")
            Card1.image = UIImage(named: p1.description())
            Card2.image = UIImage(named: p2.description())
            Card3.image = UIImage(named: p3.description())
            Card4.image = UIImage(named: p4.description())
            CutCard.image = UIImage(named: CribbageDeck().getCutCard())
            
            let old = PlayerScores().getScore("Player")
            Constants.done = CribbageDeck().scoreShortHand("Player")
            if Constants.done {
                performSegueWithIdentifier("CardsToFinal", sender: self)
            }
            
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            whoScored.text = "Player scored \(PlayerScores().getScore("Player") - old) points!"
            
            
            Dealer.text = "Dealer: Computer"
            Constants.playerdidgo = true
        } else if firstplayername == "Computer" {
            let (c1,c2,c3,c4) = CribbageDeck().hand("Computer")
            Card1.image = UIImage(named: c1.description())
            Card2.image = UIImage(named: c2.description())
            Card3.image = UIImage(named: c3.description())
            Card4.image = UIImage(named: c4.description())
            CutCard.image = UIImage(named: CribbageDeck().getCutCard())
            
            let old = PlayerScores().getScore("Computer")
            Constants.done = CribbageDeck().scoreShortHand("Computer")
            
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
            whoScored.text = "Computer scored \(PlayerScores().getScore("Computer") - old) points!"

            Dealer.text = "Dealer: Player"
            Constants.computerdidgo = true
        } else {
            print("CARDVIEW NAMING ERROR")
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    //MARK: - Segue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - Should Perform Segue
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "CardsToCrib" {
            if Constants.computerdidgo && !Constants.playerdidgo {
                let (p1,p2,p3,p4) = CribbageDeck().hand("Player")
                Card1.image = UIImage(named: p1.description())
                Card2.image = UIImage(named: p2.description())
                Card3.image = UIImage(named: p3.description())
                Card4.image = UIImage(named: p4.description())
                CutCard.image = UIImage(named: CribbageDeck().getCutCard())
                
                let old = PlayerScores().getScore("Player")
                Constants.done = CribbageDeck().scoreShortHand("Player")
                if Constants.done {
                    performSegueWithIdentifier("CardsToFinal", sender: self)
                }
                
                PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
                CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
                whoScored.text = "Player scored \(PlayerScores().getScore("Player") - old) points!"
                
                Constants.playerdidgo = true
                return false
            } else if Constants.playerdidgo && !Constants.computerdidgo {
                let (c1,c2,c3,c4) = CribbageDeck().hand("Computer")
                Card1.image = UIImage(named: c1.description())
                Card2.image = UIImage(named: c2.description())
                Card3.image = UIImage(named: c3.description())
                Card4.image = UIImage(named: c4.description())
                CutCard.image = UIImage(named: CribbageDeck().getCutCard())
                
                let old = PlayerScores().getScore("Computer")
                Constants.done = CribbageDeck().scoreShortHand("Computer")
                if Constants.done {
                    performSegueWithIdentifier("CardsToFinal", sender: self)
                }
                CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
                PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
                whoScored.text = "Computer scored \(PlayerScores().getScore("Computer") - old) points!"
                
                Constants.computerdidgo = true
                return false
            } else {
                Constants.playerdidgo = false
                Constants.computerdidgo = false
                return true
            }
        } else {
            return true
        }
    }
}
