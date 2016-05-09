//
//  CribViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class CribViewController: UIViewController {

    @IBOutlet weak var Crib1: UIImageView!
    @IBOutlet weak var Crib2: UIImageView!
    @IBOutlet weak var Crib3: UIImageView!
    @IBOutlet weak var Crib4: UIImageView!
    @IBOutlet weak var CutCard: UIImageView!
    
    @IBOutlet weak var whoScoredWhat: UILabel!
    @IBOutlet weak var dealer: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: "Wood")
        }
    }
    
    func setBackground(imagename: String) {
        backgroundImage.image = UIImage(named: imagename)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let L = CribbageDeck().getTheCrib()

        Crib1.image = UIImage(named: L[0].description())
        Crib2.image = UIImage(named: L[1].description())
        Crib3.image = UIImage(named: L[2].description())
        Crib4.image = UIImage(named: L[3].description())
        CutCard.image = UIImage(named: CribbageDeck().getCutCard())
        
        let name = CribbageDeck().whoDealtIt()
        dealer.text = "Dealer: \(name)"
        
        let old = PlayerScores().getScore(name)
        CribbageDeck().scoreCrib(name)
        playerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        computerScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
        whoScoredWhat.text = "\(name) Scored \(PlayerScores().getScore(name) - old) points!"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        CribbageDeck().restart()
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "RunToFinal" {
            if PlayerScores().winner("Player") || PlayerScores().winner("Computer") {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}
