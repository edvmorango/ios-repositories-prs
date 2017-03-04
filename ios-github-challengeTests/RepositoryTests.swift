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

    let myMock : JSON = [
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
    
    override func spec(){

        describe("entitys"){
            
        it("owner is decodable"){
            let owner  = Owner(json: self.myMock["owner"] as! JSON)
                expect(owner?.name).to(equal("Alamofire"))
            }
            it("repository is decodable"){
                let repository = Repository(json: self.myMock)
                
                expect(repository?.id).to(equal(22458259))
                
            }
        
        }
        
    
    }
    
    
    
    
    
}
