//
//  Stations.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation

struct StationInfos: Codable {
    let result: Result
}

struct Result: Codable {
    
    let offset, limit, count: Int

    let sort: String
    
    let results: [StationInfo]
}

struct StationInfo: Codable {

    var sno: String?
    
    var sna: String?
    
    var tot: String
    
    var sbi: String?
    
    var lat: String?
    
    var lng: String?
    
    var ar: String
    
    var bemp: String
    
    var act: String?
}
