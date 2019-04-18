//
//  TabBarViewController.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/9.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

enum TabBarItemType: Int {
    case station, setting
   
    var item: UITabBarItem {
        return UITabBarItem(title: title, image: image, tag: rawValue)
    }
    
    var title: String {
        switch self {
        case .station:
            return "站點"
        case .setting:
            return "設定"
        }
    }
    
    var image: UIImage {
        switch self {
        case .station:
            return UIImage(named: "bike")!.withRenderingMode(.alwaysTemplate)
        case .setting:
            return UIImage(named: "setting")!.withRenderingMode(.alwaysTemplate)
        }
    }
    
}

class TabBarViewController: UITabBarController {
    
    class var identifier: String { return String(describing: self) }

//    let station = StationViewController()
    
    let tabBarItemTypes: [TabBarItemType] = [.station, .setting]
    
    var stationViewController: StationViewController? {
        let navigationController = viewControllers?.first as? UINavigationController
        return navigationController?.viewControllers.first as? StationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        
//        return .lightContent
//        
//    }

   
    private func setup(){
  
        tabBar.barStyle = .default
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.colorWithRGBValue(red: 0, green: 153, blue: 255, alpha: 1)
        tabBar.barTintColor = UIColor.black
        
        tabBar.items?.forEach { item in
            let itemType = TabBarItemType(rawValue: item.tag)!
            item.title = itemType.title
            item.image = itemType.image
        }
    }
    

}

extension TabBarViewController {
    
    class func create() -> TabBarViewController {

        return UIStoryboard.tabBar.instantiateViewController(withIdentifier: identifier) as! TabBarViewController

    }
    
}
