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


struct PullRequestViewModel{
    let service = GithubAPIManager()
    var pullRequests = Variable<[PullRequest]>([])
    var repository: Repository? = nil{
        didSet{
            if repository != nil {
                service.searchPullRequests(container: pullRequests , repository: repository! )
            }
        }
    }

}
