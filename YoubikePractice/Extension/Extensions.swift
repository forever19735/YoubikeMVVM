//
//  Extensions.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/9.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    static func colorWithRGBValue(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

class UIUtils {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
//        
//        self.lockOrientation(orientation)
//        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
//    }
}
