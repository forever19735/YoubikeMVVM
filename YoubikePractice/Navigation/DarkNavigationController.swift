//
//  DarkNavigationController.swift
//  YoubikePractice
//
//  Created by apple on 2018/7/11.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class DarkNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        setUp()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUp()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
        
    }
    
    // MARK: Appearance
    
    override var preferredStatusBarStyle: UIStatusBarStyle {

        return .lightContent

    }
    
    // MARK: Set Up
    
    private func setUp() {

    }
}