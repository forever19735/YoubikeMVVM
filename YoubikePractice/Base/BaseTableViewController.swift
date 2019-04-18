//
//  BaseTableViewController.swift
//  YoubikePractice
//
//  Created by apple on 2018/7/11.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    // MARK: Appearance
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return .all
        default:
            return .portrait
        }
        
    }
    
}

