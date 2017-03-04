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
        self.name = ("login" <~~ json)!
        self.photo = ("avatar_url" <~~ json)!
    }
    
}

struct PullRequest: Decodable{
    let owner: Owner
    let title : String
    let date : Date
    let body : String
    
    
    
    init?(json: JSON) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM'T'HH:mm:ss'Z'"
        self.owner =  ("user" <~~ json)!
        self.title =  ("title" <~~ json)!
        self.date =   Decoder.decode(dateForKey: "created_at", dateFormatter: dateFormatter)(json)!
        self.body =   ("body" <~~ json)!

    }
    

}


