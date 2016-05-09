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
        static var pickedCardName = "LutherCard"
        static var pickedBackgroundName = "Wood"
    }
    @IBAction func done(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var whatToChange: UILabel! { didSet {
        whatToChange.text = "Pick a \(Constants.whichType)"
        }
    }
    
    @IBOutlet weak var image1: UIImageView! { didSet {
        self.image1.userInteractionEnabled = true
        image1.image = UIImage(named: Constants.imageName1)
        }
    }
    
    @IBOutlet weak var image2: UIImageView! { didSet {
        self.image2.userInteractionEnabled = true
        image2.image = UIImage(named: Constants.imageName2)
        }
    }
    
    @IBOutlet weak var image3: UIImageView! { didSet {
        self.image3.userInteractionEnabled = true
        image3.image = UIImage(named: Constants.imageName3)
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
                Constants.pickedCardName = Constants.imageName1
            case 2:
                Constants.pickedCardName = Constants.imageName2
            case 3:
                Constants.pickedCardName = Constants.imageName3
            default:
                print("ERROR PICKING CARD BACK")
            }
        } else if Constants.whichType == "Background" {
            switch whichImage {
            case 1:
                Constants.pickedBackgroundName = Constants.imageName1
            case 2:
                Constants.pickedBackgroundName = Constants.imageName2
            case 3:
                Constants.pickedBackgroundName = Constants.imageName3
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
    
    func pickedBackground() -> String {
        return Constants.pickedBackgroundName
    }
    
    func pickedCard() -> String {
        return Constants.pickedCardName
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
