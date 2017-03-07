//
//  PullRequestTableViewCell.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 6/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit



class PullRequestTableViewCell : UITableViewCell{

    @IBOutlet weak var lbPRTitle: UILabel!

    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbPRDescription: UILabel!

    @IBOutlet weak var ivOwner: UIImageView!
  
    
    @IBOutlet weak var lbLogin: UILabel!
    
    @IBOutlet weak var lbUserName: UILabel!
    
    
    override func layoutSubviews() {
        ivOwner.layer.cornerRadius = ivOwner.frame.size.width/2
        ivOwner.clipsToBounds = true
        
        self.ivOwner.layer.borderWidth = 1.0;
        self.ivOwner.layer.borderColor = UIColor.black.cgColor
        
    }
 }
