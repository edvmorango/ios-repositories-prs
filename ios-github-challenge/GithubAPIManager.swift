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
    
    func getJSONArray() -> [JSON]{
        return try! self.mapJSON() as! [JSON]
    }
}

struct GithubAPIManager{
    let provider : RxMoyaProvider<GithubAPI>
    let bag = DisposeBag()
   
    // Solves  "?" to "%3F" problem
    let urlSolver = { (target: GithubAPI) -> Endpoint<GithubAPI> in
        let url = target.baseURL.absoluteString.appending(target.path)
        return Endpoint(url:  url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
    }
    
    init() {
        provider = RxMoyaProvider<GithubAPI>()
    }

}

extension GithubAPIManager{
    
    public func searchRepositories(container: Variable<[Repository]> ,maxPage : Int) {
        
        let rxProvider = RxMoyaProvider<GithubAPI>(endpointClosure: urlSolver)
        rxProvider.request(.repository(page: maxPage)).filterSuccessfulStatusCodes().map{  [Repository].from(jsonArray:$0.getJSON()["items"] as! [JSON])  }.subscribe{ event in
            switch event{
            case .next(let rep) : container.value = rep!
            case .error(let error): print(error)
            default : break
            }
        }.addDisposableTo(bag)
        
        }
    
    public func getUser(username: String, setUser: @escaping (Owner) -> Void){
        let rxProvider = RxMoyaProvider<GithubAPI>(endpointClosure: urlSolver)
        rxProvider.request(.user(username: username)).filterSuccessfulStatusCodes().map{ Owner.init(json: $0.getJSON()) }.subscribe{ event in
            switch event{
            case .next(let ow) :    setUser(ow!)
            case .error(let error): print(error)
            default : break
            }
        }.addDisposableTo(bag)
    }
    
    
    public func searchPullRequests( container:  Variable<[PullRequest]>,repository: Repository){
    
        let rxProvider = RxMoyaProvider<GithubAPI>()
        rxProvider.request(.pullRequest(repository: repository)).filterSuccessfulStatusCodes().map{ [PullRequest].from( jsonArray: $0.getJSONArray()  ) }.subscribe{ event in
            switch event{
            case .next(let pr) :    container.value = pr!
            case .error(let error): print(error)
            default : break
            }

        
        }.addDisposableTo(bag)
        
    }
    
    

}









