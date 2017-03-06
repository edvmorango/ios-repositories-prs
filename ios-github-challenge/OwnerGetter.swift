//
//  OwnerProtocol.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 6/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation


protocol OwnerGetter {
    
    
    func getOwner(name : String , handler : @escaping (Owner) -> Void  )

}

