//
//  SettingsViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/8/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Settings View Controller

class SettingsViewController: UIViewController {
    
    //MARK: - Constants
    
    fileprivate struct Constants {
        static var imageName1 = ""
        static var imageName2 = ""
        static var imageName3 = ""
        static var whichType = ""
        static var pickedCardName = "LutherCard"
        static var pickedBackgroundName = "Wood"
    }
    
    //MARK: - Outlets
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var whatToChange: UILabel! { didSet {
        whatToChange.text = "Pick a \(Constants.whichType)"
        }
    }
    
    @IBOutlet weak var image1: UIImageView! { didSet {
        self.image1.isUserInteractionEnabled = true
        image1.image = UIImage(named: Constants.imageName1)
        }
    }
    
    @IBOutlet weak var image2: UIImageView! { didSet {
        self.image2.isUserInteractionEnabled = true
        image2.image = UIImage(named: Constants.imageName2)
        }
    }
    
    @IBOutlet weak var image3: UIImageView! { didSet {
        self.image3.isUserInteractionEnabled = true
        image3.image = UIImage(named: Constants.imageName3)
        }
    }
    
    @IBAction func image1Tap(_ sender: UITapGestureRecognizer) {
        imageTap(1)
    }
    
    @IBAction func image2Tap(_ sender: UITapGestureRecognizer) {
        imageTap(2)
    }
    
    @IBAction func image3Tap(_ sender: UITapGestureRecognizer) {
        imageTap(3)
    }
    
    //MARK: - Image Tap
    
    func imageTap(_ whichImage: Int) {
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
    
    //MARK: - View Did Load
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Card
    
    func setCard() {
        Constants.imageName1 = "bicycleback"
        Constants.imageName2 = "LutherCard"
        Constants.imageName3 = "ISUCard"
        Constants.whichType = "Card"
    }
    
    func pickedCard() -> String {
        return Constants.pickedCardName
    }
    
    //MARK: - Background
    
    func setBackground() {
        Constants.imageName1 = "Wood"
        Constants.imageName2 = "Marble"
        Constants.imageName3 = "Space"
        Constants.whichType = "Background"
    }
    
    func pickedBackground() -> String {
        return Constants.pickedBackgroundName
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
