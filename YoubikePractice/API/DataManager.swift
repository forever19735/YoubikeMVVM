//
//  DataManager.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {
    static var shared = DataManager()
}

extension DataManager {
    
    typealias requestStationSuccess = (StationInfos) -> Void
    
    typealias requestStationFailure = (Error) -> Void
    
    func requestStaion(_ success: @escaping requestStationSuccess, failure: requestStationFailure? = nil) -> Request{
        
        let endPoint = Router.getStations()
        return Alamofire.request(endPoint).validate().responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(_):
                if let data = response.data{
                    let decoder = JSONDecoder()
                    do {
                        let value = try decoder.decode(StationInfos.self, from: data)
                        success(value)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                failure?(error)
            }
        })
    }
    
    typealias requestLoaclSuccess = (StationInfos) -> Void

    typealias requestLoaclFailure = (Error) -> Void
    
    func requestLocal(_ success: @escaping requestLoaclSuccess, failure: requestLoaclFailure? = nil
        ){
        let baseUrl = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5")

        let request = URLRequest(url: baseUrl!)

        let session = URLSession.shared
        let decoder = JSONDecoder()
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do{
                    let value = try decoder.decode(StationInfos.self, from: data)
                    success(value)
                }catch{
                    failure?(error)
                }
            }
        }
        task.resume()
    }
}
