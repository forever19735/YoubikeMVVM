//
//  Router.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 Johnny. All rights reserved.
//
import Alamofire
import SwiftyJSON

typealias Object = [String: Any]

enum Router {
    case getStations()
    case getLocal()
}

extension Router: URLRequestConvertible {
    
    var baseURL: URL {
        return URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5")!
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getStations, .getLocal:
            
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .getStations():
            var urlRequest = URLRequest(url: baseURL)
            urlRequest.httpMethod = method.rawValue
            
            return urlRequest
        case .getLocal():
            var urlRequest = URLRequest(url: baseURL)
            urlRequest.httpMethod = method.rawValue
            
            return urlRequest
        }
    }
}
