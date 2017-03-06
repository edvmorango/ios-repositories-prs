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
    case user(username : String)
}
extension GithubAPI: TargetType{
    /// The method used for parameter encoding.
    
    var baseURL: URL { return
        URL(string: "https://api.github.com/")!
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        switch self {
        case .repository(let page): let a = "search/repositories?q=language:Swift&sort=stars&page=\(page)"
            return a
        case .pullRequest(let repository):
            let a = "repos/\(repository.owner.login)/\(repository.name)/pulls"
            return a
        case .user(let username) :  return "users/\(username)"
        }
        
    }
    
    var method: Moya.Method{
        switch self{ case .repository, .pullRequest, .user : return .get}
    }
    
    
    public var parameterEncoding: Moya.ParameterEncoding{ return URLEncoding.default}
    
    
    public var parameters: [String: Any]?{
        switch self{
        case .repository : return nil
        case .pullRequest : return  nil
        case .user : return nil
        }
    }
    
    public var task: Task{ return .request}
    public var sampleData: Data{
        switch self{
        default : return Data()
        }
    
    }
    

    
    
}
