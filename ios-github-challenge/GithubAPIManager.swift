//
//  GithubProvider.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift
import Alamofire
import Gloss

extension Response{

    func getJSON() -> JSON{
        return try! self.mapJSON() as! JSON
    }
}

struct GithubAPIManager{
    let provider : RxMoyaProvider<GithubAPI>
    let bag = DisposeBag()
    
    init() {
        provider = RxMoyaProvider<GithubAPI>()
    }

}

extension GithubAPIManager{
    
    public func searchRepositories(container: Variable<[Repository]> ,maxPage : Int) {
        let endpointClosure = { (target: GithubAPI) -> Endpoint<GithubAPI> in
            let url = target.baseURL.absoluteString.appending(target.path)
            return Endpoint(url:  url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
        }
        
        let rxProvider = RxMoyaProvider<GithubAPI>(endpointClosure: endpointClosure)
        rxProvider.request(.repository(page: maxPage)).filterSuccessfulStatusCodes().map{  [Repository].from(jsonArray:$0.getJSON()["items"] as! [JSON]) }.subscribe{ event in
            switch event{
            case .next(let rep) :  container.value = rep!
            case .error(let error): print(error)
            default : break
            }
        }.addDisposableTo(bag)
        
        }
        
    public func searchPullRequests(repository: Repository){
    
        let rxProvider = RxMoyaProvider<GithubAPI>()
        rxProvider.request(.pullRequest(repository: repository)).filterSuccessfulStatusCodes().map{ $0 }
        
    }
        
        
        
    

}









