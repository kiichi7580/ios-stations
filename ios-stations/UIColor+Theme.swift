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
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
