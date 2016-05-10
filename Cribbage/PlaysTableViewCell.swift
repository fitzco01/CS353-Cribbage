//
//  PlaysTableViewCell.swift
//  Cribbage
//
//  Created by Connor Fitzpatrick on 4/30/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

//MARK: - Play Table View Cell

class PlaysTableViewCell: UITableViewCell {
    
    //MARK: - Outlets

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var playNumberLabel: UILabel!
    
    //MARK: - Configure
    
    func configure(card: Card, player: Player, playnumber: String) {
        playerLabel.text = player.name
        cardLabel.text = card.description()
        playNumberLabel.text = playnumber
        imageLabel.image = UIImage(named: card.description())
    }
}
