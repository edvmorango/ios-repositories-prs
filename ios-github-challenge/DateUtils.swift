//
//  Utils.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 7/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation



extension Date{


    func getFormmatedDate(format : String =  "dd/MM/yyyy" ) ->  String{
    
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let formmatedDate = formatter.string(from: self)
    
        return formmatedDate
    }
    

}
