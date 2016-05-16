//
//  ScoresTableViewController.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/29/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Score Table View

class ScoresTableViewController: UITableViewController {
    
    //MARK: - Outlets

    @IBAction func done(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: - Memory Warning

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View Data Source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ScoreHistory().getCard().count == ScoreHistory().getCards().count  && ScoreHistory().getCards().count == ScoreHistory().getNames().count && ScoreHistory().getNames().count == ScoreHistory().getScoreType().count && ScoreHistory().getNames().count == ScoreHistory().getScoreType().count {
            return ScoreHistory().getCard().count
        } else {
            print("ERROR: THE SCORE HISTORY LISTS ARE NOT EQUAL 1!")
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScoreCell", forIndexPath: indexPath) as! ScoresTableViewCell
        
        let card = ScoreHistory().getCard()[indexPath.row]
        let player = ScoreHistory().getNames()[indexPath.row]
        let othercards = ScoreHistory().getCards()[indexPath.row]
        let scoretype = ScoreHistory().getScoreType()[indexPath.row]
        let pointtotal = ScoreHistory().getPointValue()[indexPath.row]
        let count: Int
        var description = ""
        
        if ScoreHistory().getCard().count == ScoreHistory().getCards().count  && ScoreHistory().getCards().count == ScoreHistory().getNames().count && ScoreHistory().getNames().count == ScoreHistory().getScoreType().count && ScoreHistory().getNames().count == ScoreHistory().getScoreType().count {
            count = ScoreHistory().getPointValue().count - indexPath.row
        } else {
            print("ERROR: THE SCORE HISTORY LISTS ARE NOT EQUAL 2!")
            count = 0
        }
        
        var loop = 0
        for acard in othercards {
            if scoretype == "last card" && othercards.count > 1 {
                if loop == 0 {
                    loop += 1
                } else {
                    description += acard.description() + ","
                }
            } else if scoretype == "last card" && othercards.count == 1 {
                description = "no other cards,"
            } else {
                description += acard.description() + ","
            }
        }
        var newdescription = description.substringToIndex(description.endIndex.predecessor())
        newdescription += "."
        
        if scoretype == "nibs" {
            newdescription = "no other cards."
        }

        cell.configure(card, othercards: newdescription, scoretype: scoretype, player: player, scorenumber: "Score #\(count)", points: pointtotal)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
