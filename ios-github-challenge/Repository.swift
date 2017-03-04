//
//  Repository.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 3/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//



import Gloss


struct Repository: Decodable{

    let id : Int
    let name: String
    let description: String
    let stars: Int
    let forks: Int
    let owner : Owner

    
    init?(json: JSON) {
        self.id = ("id" <~~ json)!
        self.name = ("name" <~~ json)!
        self.description = ("description" <~~ json)!
        self.stars = ("stargazers_count" <~~ json)!
        self.forks = ("forks" <~~ json)!
        self.owner = ("owner" <~~ json)!
    }
    
    
}

struct Owner : Decodable{
    let name : String
    let photo : String
    
    init?(json: JSON) {
        self.name = ("name" <~~ json)!
        self.photo = ("photo" <~~ json)!
        
    }
    
}



