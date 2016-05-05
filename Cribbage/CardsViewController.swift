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
    
    @IBOutlet weak var CutCard: UIImageView! { didSet {
        self.CutCard.userInteractionEnabled = false
        CutCard.image = UIImage(named: "bicycleback")
        print("CutCard \(CutCard.description)")
        }
    }
    
    @IBOutlet weak var Card1: UIImageView! { didSet {
        self.Card1.userInteractionEnabled = false
        Card1.image = UIImage(named: "bicycleback")
        print("Card1 \(Card1.description)")
        }
    }
    
    @IBOutlet weak var Card2: UIImageView! { didSet {
        self.Card2.userInteractionEnabled = false
        Card2.image = UIImage(named: "bicycleback")
        print("Card2 \(Card2.description)")
        }
    }
    
    @IBOutlet weak var Card3: UIImageView! { didSet {
        self.Card3.userInteractionEnabled = false
        Card3.image = UIImage(named: "bicycleback")
        print("Card3 \(Card3.description)")
        }
    }
    
    @IBOutlet weak var Card4: UIImageView! { didSet {
        self.Card4.userInteractionEnabled = false
        Card4.image = UIImage(named: "bicycleback")
        print("Card4 \(Card4.description)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let (p1,p2,p3,p4,pc) = CribbageDeck().hand("Player")
        let (c1,c2,c3,c4,cc) = CribbageDeck().hand("Computer")
        let firstplayername = CribbageDeck().whoDidntDealIt()
        
        if firstplayername == "Player" {
            Card1.image = UIImage(named: p1.description())
            Card2.image = UIImage(named: p2.description())
            Card3.image = UIImage(named: p3.description())
            Card4.image = UIImage(named: p4.description())
            CutCard.image = UIImage(named: pc.description())
        } else if firstplayername == "Computer" {
            Card1.image = UIImage(named: c1.description())
            Card2.image = UIImage(named: c2.description())
            Card3.image = UIImage(named: c3.description())
            Card4.image = UIImage(named: c4.description())
            CutCard.image = UIImage(named: cc.description())
        } else {
            print("CARDVIEW NAMING ERROR")
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
