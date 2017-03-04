//
//  RepositoryTests.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Alamofire
import Gloss
@testable import ios_github_challenge

class RepositoryTests : QuickSpec{

    let repositoryMock : JSON = [
        "id" : 22458259,
        "name" : "Alamofire",
        "description": "Elegant HTTP Networking in Swift",
        "stargazers_count": 22270,
        "forks": 3838,
        "owner" : [
            "login": "Alamofire",
            "avatar_url": "https://avatars0.githubusercontent.com/u/7774181?v=3"
        ]
    ]
    
    let prMock: JSON =  [

        "title": "add LICENSE Link",
        "body": "Part of License is `See LICENCE for details' in README.\r\n\r\nBut It's not uncomfortable and unkind\r\n\r\nI added LICENSE link.",
        "created_at": "2017-03-01T16:30:15Z",
        "user": [
            "login": "helloyako",
            "avatar_url": "https://avatars1.githubusercontent.com/u/5343804?v=3",
        ]
        
    ]
  
    override func spec(){

        describe("entities"){
            
        it("owner is decodable"){
            let rOwner  = Owner(json: self.repositoryMock["owner"] as! JSON)
            let pOwner =  Owner(json: self.prMock["user"] as! JSON)
            expect(rOwner?.name).to(equal("Alamofire"))
            expect(pOwner?.name).to(equal("helloyako"))
        }
        it("repository is decodable"){
                let repository = Repository(json: self.repositoryMock)
                expect(repository?.id).to(equal(22458259))
        }
            it("pr is decodable"){
                let pr = PullRequest(json: self.prMock)
                expect(pr?.title).to(equal("add LICENSE Link"))
            }
            
        }
        
    
    }
    
    
    
    
    
}
