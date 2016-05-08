//
//  CardsViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/3/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBAction func Next(sender: UIButton) {
        if Constants.computerdidgo && Constants.playerdidgo {
            performSegueWithIdentifier("CardsToCrib", sender: sender)
        } 
    }
    @IBOutlet weak var Dealer: UILabel!
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if History().playLength() != 0 {
            if ScoringRun().getruncount() != 31 {
                ScoringRun().lastcard(History().mostRecentPlayer().name)
                PlayerScores().addScore(History().mostRecentPlayer().name, newpoints: 1)
            }
            print("deleting history 4")
            History().deleteHistory()
            ScoringRun().resetruncount()
        }
        

        let firstplayername = CribbageDeck().whoDidntDealIt()
        
        if firstplayername == "Player" {
            let (p1,p2,p3,p4) = CribbageDeck().hand("Player")
            print("PLAYER CARDS + cut \(p1,p2,p3,p4)")
            Card1.image = UIImage(named: p1.description())
            Card2.image = UIImage(named: p2.description())
            Card3.image = UIImage(named: p3.description())
            Card4.image = UIImage(named: p4.description())
            CutCard.image = UIImage(named: CribbageDeck().getCutCard())
            
            let old = PlayerScores().getScore("Player")
            CribbageDeck().scoreShortHand("Player")
            
            PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
            CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
            whoScored.text = "Player scored \(PlayerScores().getScore("Player") - old) points!"
            
            
            Dealer.text = "Dealer: Computer"
            Constants.playerdidgo = true
        } else if firstplayername == "Computer" {
            let (c1,c2,c3,c4) = CribbageDeck().hand("Computer")
            print("COMPUTER CARDS + Cut \(c1,c2,c3,c4)")
            Card1.image = UIImage(named: c1.description())
            Card2.image = UIImage(named: c2.description())
            Card3.image = UIImage(named: c3.description())
            Card4.image = UIImage(named: c4.description())
            CutCard.image = UIImage(named: CribbageDeck().getCutCard())
            
            let old = PlayerScores().getScore("Computer")
            CribbageDeck().scoreShortHand("Computer")
            
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "CardsToCrib" {
            if Constants.computerdidgo && !Constants.playerdidgo {
                let (p1,p2,p3,p4) = CribbageDeck().hand("Player")
                print("PLAYER CARDS + cut \(p1,p2,p3,p4)")
                Card1.image = UIImage(named: p1.description())
                Card2.image = UIImage(named: p2.description())
                Card3.image = UIImage(named: p3.description())
                Card4.image = UIImage(named: p4.description())
                CutCard.image = UIImage(named: CribbageDeck().getCutCard())
                
                let old = PlayerScores().getScore("Player")
                CribbageDeck().scoreShortHand("Player")
                
                PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
                CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
                whoScored.text = "Player scored \(PlayerScores().getScore("Player") - old) points!"
                
                Constants.playerdidgo = true
                print("FALSE 1")
                return false
            } else if Constants.playerdidgo && !Constants.computerdidgo {
                let (c1,c2,c3,c4) = CribbageDeck().hand("Computer")
                print("COMPUTER CARDS + Cut \(c1,c2,c3,c4)")
                Card1.image = UIImage(named: c1.description())
                Card2.image = UIImage(named: c2.description())
                Card3.image = UIImage(named: c3.description())
                Card4.image = UIImage(named: c4.description())
                CutCard.image = UIImage(named: CribbageDeck().getCutCard())

                let old = PlayerScores().getScore("Computer")
                CribbageDeck().scoreShortHand("Computer")
                CPUScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
                PlayerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
                whoScored.text = "Computer scored \(PlayerScores().getScore("Computer") - old) points!"
                
                Constants.computerdidgo = true
                print("FALSE 2")
                return false
            } else {
                print("TRUE 1")
                Constants.playerdidgo = false
                Constants.computerdidgo = false
                return true
            }
        } else {
            print("TRUE 2")
            return true
        }
    }
}
