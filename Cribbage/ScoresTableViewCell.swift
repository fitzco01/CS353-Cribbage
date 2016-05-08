//
//  ScoresTableViewCell.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 5/7/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ScoresTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scoreNumberLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    func configure(card: Card, othercards: String, scoretype: String, player: String, scorenumber: String, points: Int) {
        playerLabel.text = player
        descriptionLabel.text = "Scored a \(scoretype) with \(card.description()) and \(othercards)"
        scoreNumberLabel.text = scorenumber
        pointLabel.text = "Points: \(points)"
        imageLabel.image = UIImage(named: card.description())
    }
}
