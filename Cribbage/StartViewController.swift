//
//  StartViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Start View Controller

class StartViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBAction func newGame(sender: UIButton) {
        CribbageDeck().start()
    }
    
    @IBOutlet weak var backgroundImage: UIImageView! { didSet {
        backgroundImage.image = UIImage(named: "Wood")
        }
    }

    //MARK: - View Did Load
    
    override func viewDidLoad() {
        backgroundImage.image = UIImage(named: "Wood")
        setBackground()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - View Will Appear
    
    override func viewWillAppear(animated: Bool) {
        backgroundImage.image = UIImage(named: "Wood")
        setBackground()
        super.viewWillAppear(animated)
    }
    
    //MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Background
    
    func setBackground() {
        if backgroundImage != nil {
            backgroundImage.image = UIImage(named: SettingsViewController().pickedBackground())
        }
    }
    
    /*
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Should Perform Segue
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "ChangeTheBackground" {
            SettingsViewController().setBackground()
            return true
        } else if identifier == "ChangeTheCard" {
            SettingsViewController().setCard()
            return true
        } else {
            return true
        }
    }
}
