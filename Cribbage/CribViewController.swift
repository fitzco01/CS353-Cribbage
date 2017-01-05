//
//  CribViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Crib View Controller

class CribViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var Crib1: UIImageView!
    @IBOutlet weak var Crib2: UIImageView!
    @IBOutlet weak var Crib3: UIImageView!
    @IBOutlet weak var Crib4: UIImageView!
    @IBOutlet weak var CutCard: UIImageView!
    
    @IBOutlet weak var whoScoredWhat: UILabel!
    @IBOutlet weak var dealer: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    @IBAction func next(_ sender: AnyObject) {
        if Constants.done {
            performSegue(withIdentifier: "CribToFinal", sender: self)
        }
    }
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: "Wood")
        }
    }
    
    //MARK: - Background

    func setBackground() {
        if backgroundImage != nil {
            backgroundImage.image = UIImage(named: SettingsViewController().pickedBackground())
        }

    }
    
    //MARK: - Constants
    
    fileprivate struct Constants {
        static var done = false
    }
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Wood")
        setBackground()
        let L = CribbageDeck().getTheCrib()

        Crib1.image = UIImage(named: L[0].description())
        Crib2.image = UIImage(named: L[1].description())
        Crib3.image = UIImage(named: L[2].description())
        Crib4.image = UIImage(named: L[3].description())
        CutCard.image = UIImage(named: CribbageDeck().getCutCard())
        
        let name = CribbageDeck().whoDealtIt()
        dealer.text = "Dealer: \(name)"
        
        let old = PlayerScores().getScore(name)
        Constants.done = CribbageDeck().scoreCrib(name)

        playerScore.text = "Player Score: \(PlayerScores().getScore("Player"))"
        computerScore.text = "CPU Score: \(PlayerScores().getScore("Computer"))"
        whoScoredWhat.text = "\(name) Scored \(PlayerScores().getScore(name) - old) points!"

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        CribbageDeck().restart()
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
