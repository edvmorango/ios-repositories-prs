//
//  MainViewModel.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import RxSwift
import SDWebImage
struct MainViewModel{
    let service = GithubAPIManager()
    var repositories = Variable<[Repository]>([])
    var currentPage :  Int = 0 {
        didSet{
            if self.currentPage < 35{
                service.searchRepositories(container: repositories, maxPage: self.currentPage)
                                }
                }
    }
    
    func getOwner(login : String , handler : @escaping (Owner) -> Void  ){
        service.getUser(username: login  , setUser: handler)
    }
    
    

}
