//
//  GithubAPI.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Moya
import Alamofire
import Foundation

enum GithubAPI{
    case repository(page: Int)
    case pullRequest(repository: Repository)
}
extension GithubAPI: TargetType{
    /// The method used for parameter encoding.
    
    var baseURL: URL { return
        URL(string: "https://api.github.com/")!
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        switch self {
        case .repository(let page): return "search/repositories?q=language:Swift&sort=stars&page=\(page)"
        case .pullRequest(let repository): return "repos/\(repository.owner.name)/\(repository.name)/pulls"
        }
        
    }
    
    var method: Moya.Method{
        switch self{ case .repository, .pullRequest : return .get}
    }
    
    
    public var parameterEncoding: Moya.ParameterEncoding{ return URLEncoding.default}
    
    
    public var parameters: [String: Any]?{
        switch self{
        case .repository : return nil
        case .pullRequest : return  nil
        }
    }
    
    public var task: Task{ return .request}
    public var sampleData: Data{
        switch self{
        default : return Data()
        }
    
    }
    

    
    
}
