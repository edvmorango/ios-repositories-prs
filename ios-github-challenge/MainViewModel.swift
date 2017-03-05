//
//  MainViewModel.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import RxSwift

struct MainViewModel{
    let service = GithubAPIManager()
    var repositories = Variable<[Repository]>([])
    
    
    
    func checkRepositories(){
        
        service.searchRepositories(container: repositories, maxPage: 1)
        
    
    }
    
    
    

}
