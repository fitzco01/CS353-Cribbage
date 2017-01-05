//
//  FinalViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/8/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Final View Controller

class FinalViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var whoWon: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    @IBAction func newGame(_ sender: UIButton) {
        History().deleteHistory()
        ScoreHistory().deleteScoreHistory()
    }
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cscore = PlayerScores().getScore("Computer")
        let pscore = PlayerScores().getScore("Player")
        
        if pscore > cscore {
            finalScore.text = "Final Score: \(pscore) to \(cscore)"
            whoWon.text = "The Player Won!"
        } else {
            finalScore.text = "Final Score: \(cscore) to \(pscore)"
            whoWon.text = "The Computer Won!"
        }
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
