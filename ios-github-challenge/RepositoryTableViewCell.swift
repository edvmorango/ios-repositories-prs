//
//  RepositoryCell.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit



class RepositoryTableViewCell : UITableViewCell{

    @IBOutlet weak var lbRepositoryName: UILabel!
    @IBOutlet weak var lbRepositoryDesc: UILabel!
    @IBOutlet weak var ivOwner: UIImageView!
    @IBOutlet weak var lbForks: UILabel!
    @IBOutlet weak var lbStars: UILabel!
    @IBOutlet weak var lbUserLogin: UILabel!
    @IBOutlet weak var lbUserName: UILabel!
    

    override func layoutSubviews() {
        ivOwner.layer.cornerRadius = ivOwner.frame.size.width/2
        ivOwner.clipsToBounds = true
     
        self.ivOwner.layer.borderWidth = 1.0;
        self.ivOwner.layer.borderColor = UIColor.black.cgColor

    }
        
    

    
    
    
}
