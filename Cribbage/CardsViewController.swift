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
    
    //Need to add these 2 labels still!!!
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
        static var playerscore = 0
        static var computerscore = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstplayername = CribbageDeck().whoDidntDealIt()
        
        if firstplayername == "Player" {
            let (p1,p2,p3,p4) = CribbageDeck().hand("Player"
            )
            print("PLAYER CARDS + cut \(p1,p2,p3,p4)")
            Card1.image = UIImage(named: p1.description())
            Card2.image = UIImage(named: p2.description())
            Card3.image = UIImage(named: p3.description())
            Card4.image = UIImage(named: p4.description())
            CutCard.image = UIImage(named: CribbageDeck().getCutCard())
            
            let old = Constants.playerscore
            Constants.playerscore += CribbageDeck().scoreHand("Player")
            
            PlayerScore.text = "Player Score: \(Constants.playerscore)"
            CPUScore.text = "CPU Score: \(Constants.computerscore)"
            whoScored.text = "Player scored \(Constants.playerscore - old) points!"
            
            
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
            
            
            let old = Constants.computerscore
            Constants.computerscore += CribbageDeck().scoreShortHand("Computer")
            
            CPUScore.text = "CPU Score: \(Constants.computerscore)"
            PlayerScore.text = "Player Score: \(Constants.playerscore)"
            whoScored.text = "Computer scored \(Constants.computerscore - old) points!"

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
                
                let old = Constants.playerscore
                Constants.playerscore += CribbageDeck().scoreHand("Player")
                
                PlayerScore.text = "Player Score: \(Constants.playerscore)"
                CPUScore.text = "CPU Score: \(Constants.computerscore)"
                whoScored.text = "Player scored \(Constants.playerscore - old) points!"
                
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

                let old = Constants.computerscore
                print("OLD \(old)")
                Constants.computerscore += CribbageDeck().scoreShortHand("Computer")
                print("NEW \(Constants.computerscore)")
                CPUScore.text = "CPU Score: \(Constants.computerscore)"
                PlayerScore.text = "Player Score: \(Constants.playerscore)"
                whoScored.text = "Computer scored \(Constants.computerscore - old) points!"
                
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
