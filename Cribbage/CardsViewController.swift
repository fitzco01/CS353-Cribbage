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
    }
    @IBOutlet weak var Dealer: UILabel!
    @IBOutlet weak var CPUScore: UILabel!
    @IBOutlet weak var PlayerScore: UILabel!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var CutCard: UIImageView!
    
    @IBOutlet weak var Card1: UIImageView!
    
    
    @IBOutlet weak var Card2: UIImageView!
    
    @IBOutlet weak var Card3: UIImageView!
    
    @IBOutlet weak var Card4: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
