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

class EntitiesTests : QuickSpec{

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
    
    let compositeRepositoryMock : JSON = [ "items" : [
        [
            "id" : 22458259,
            "name" : "Alamofire",
            "description": "Elegant HTTP Networking in Swift",
            "stargazers_count": 22270,
            "forks": 3838,
            "owner" : [
                "login": "Alamofire",
                "avatar_url": "https://avatars0.githubusercontent.com/u/7774181?v=3"
            ]
        ],
        [
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
        ]]
    
    
    let prMock: JSON =  [

        "title": "add LICENSE Link",
        "body": "Part of License is `See LICENCE for details' in README.\r\n\r\nBut It's not uncomfortable and unkind\r\n\r\nI added LICENSE link.",
        "created_at": "2017-02-27T22:13:28Z",
        "html_url": "https://api.github.com/repos/vsouza/awesome-ios/pulls/1531",
        "user": [
            "login": "helloyako",
            "avatar_url": "https://avatars1.githubusercontent.com/u/5343804?v=3",
        ]
        
    ]
    
    let prCountMock: JSON = [
        "total_count" : 1000
    ]
  
    override func spec(){

        describe("entities"){
            
            it("owner is decodable"){
                let rOwner  = Owner(json: self.repositoryMock["owner"] as! JSON)
                let pOwner =  Owner(json: self.prMock["user"] as! JSON)
                expect(rOwner?.login).to(equal("Alamofire"))
                expect(pOwner?.login).to(equal("helloyako"))
        }
            it("repository is decodable"){
                let repository = Repository(json: self.repositoryMock)
                expect(repository?.id).to(equal(22458259))
        }
            it("pr is decodable"){
                let pr = PullRequest(json: self.prMock)
                expect(pr?.title).to(equal("add LICENSE Link"))
        }
         
            it("list of repositories is decodable"){
                let repositories : [Repository] =  [Repository].from(jsonArray: self.compositeRepositoryMock["items"] as! [JSON])!
                expect(repositories.count).to(equal(2))
            }
            it("count of prs is decodable"){
                let prCount = PullCount(json: self.prCountMock)
                expect(prCount?.total_count).to(equal(1000))
                
            }
            
        }
        
    
    }
    
    
    
    
    
}
