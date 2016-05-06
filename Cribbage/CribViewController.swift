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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let L = CribbageDeck().getTheCrib()
        Crib1.image = UIImage(named: L[0].description())
        Crib2.image = UIImage(named: L[1].description())
        Crib3.image = UIImage(named: L[2].description())
        Crib4.image = UIImage(named: L[3].description())
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
}
