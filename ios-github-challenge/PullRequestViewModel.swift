//
//  PullRequestViewModel.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 6/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import RxSwift
import SDWebImage


struct PullRequestViewModel : OwnerGetter{
    let service = GithubAPIManager()
    var pullRequests = Variable<[PullRequest]>([])
    var openPR = Variable<Int>(0)
    var closedPR = Variable<Int>(0)
    
    
    var repository: Repository? = nil{
        didSet{
            if repository != nil {
                service.searchPullRequests(container: pullRequests , repository: repository! )
                service.prRequest(container: openPR, repository: repository!, state: "open")
                service.prRequest(container: closedPR, repository: repository!, state: "closed")
                
                
                
            }
        }
    }
    //For some reason, if i create this function inside an extension, the closure doesn't execute
    func getOwner(login : String , handler : @escaping (Owner) -> Void  ){
        service.getUser(username: login  , setUser: handler)
    }
    
    

    
    
    
    
}
