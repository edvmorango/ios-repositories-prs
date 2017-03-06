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
    var repository: Repository? = nil{
        didSet{
            if repository != nil {
                service.searchPullRequests(container: pullRequests , repository: repository! )
            }
        }
    }
    //For some reason, if i create this function inside an extension, the closure doesn't execute
    func getOwner(name : String , handler : @escaping (Owner) -> Void  ){
        service.getUser(username: name  , setUser: handler)
    }
    
    

    
    
    
    
}
