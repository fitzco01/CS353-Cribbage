//
//  FinalViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/8/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var whoWon: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        whoWon.text = History().mostRecentPlayer().name
        let cscore = PlayerScores().getScore("Computer")
        let pscore = PlayerScores().getScore("Player")
        
        if pscore > cscore {
            finalScore.text = "Final Score: \(pscore) to \(cscore)"
        } else {
            finalScore.text = "Final Score: \(cscore) to \(pscore)"
        }
        
        // Do any additional setup after loading the view.
    }

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
