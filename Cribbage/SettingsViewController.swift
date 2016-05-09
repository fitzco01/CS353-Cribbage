//
//  SettingsViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/8/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private struct Constants {
        static var imageName1 = ""
        static var imageName2 = ""
        static var imageName3 = ""
        static var whichType = ""
    }
    @IBAction func done(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var whatToChange: UILabel! { didSet {
        whatToChange.text = "Pick a \(Constants.whichType)"
        }
    }
    
    @IBOutlet weak var image1: UIImageView! { didSet {
        image1.image = UIImage(named: Constants.imageName1)
        }
    }
    
    @IBOutlet weak var image2: UIImageView! { didSet {
        image1.image = UIImage(named: Constants.imageName2)
        }
    }
    
    @IBOutlet weak var image3: UIImageView! { didSet {
        image1.image = UIImage(named: Constants.imageName3)
        }
    }
    
    @IBAction func image1Tap(sender: UITapGestureRecognizer) {
        imageTap(1)
    }
    
    @IBAction func image2Tap(sender: UITapGestureRecognizer) {
        imageTap(2)
    }
    
    @IBAction func image3Tap(sender: UITapGestureRecognizer) {
        imageTap(3)
    }
    
    func imageTap(whichImage: Int) {
        if Constants.whichType == "Card" {
            
        switch whichImage {
        case 1:
            HandViewController().setCard(Constants.imageName1)
        case 2:
            HandViewController().setCard(Constants.imageName2)
        case 3:
            HandViewController().setCard(Constants.imageName3)
        default:
            print("ERROR PICKING CARD BACK")
        }
        } else if Constants.whichType == "Background" {
            switch whichImage {
            case 1:
                HandViewController().setBackground(Constants.imageName1)
                CardsViewController().setBackground(Constants.imageName1)
                CribViewController().setBackground(Constants.imageName1)
                StartViewController().setBackground(Constants.imageName1)
            case 2:
                HandViewController().setBackground(Constants.imageName2)
                CardsViewController().setBackground(Constants.imageName2)
                CribViewController().setBackground(Constants.imageName2)
                StartViewController().setBackground(Constants.imageName2)
            case 3:
                HandViewController().setBackground(Constants.imageName3)
                CardsViewController().setBackground(Constants.imageName3)
                CribViewController().setBackground(Constants.imageName3)
                StartViewController().setBackground(Constants.imageName3)
            default:
                print("ERROR PICKING BACKGROUND")
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setCard() {
        Constants.imageName1 = "bicycleback"
        Constants.imageName2 = "LutherCard"
        Constants.imageName3 = "ISUCard"
        Constants.whichType = "Card"
    }
    
    func setBackground() {
        Constants.imageName1 = "Wood"
        Constants.imageName2 = "Marble"
        Constants.imageName3 = "Space"
        Constants.whichType = "Background"
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
