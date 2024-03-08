//
//  UIColor+Theme.swift
//  ios-stations
//

import UIKit

extension UIColor {
    struct Theme {
        static var main: UIColor {
            if let color = UIColor(named: "Main") {
                return color
            } else {
                return .white // デフォルトの色を指定するか、必要に応じて適切な色を指定します。
            }
        }
    }
    
    static var random: UIColor {
        let r = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: r, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
