//
//  ColorExtension.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/10/08.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class var random: UIColor {
        return UIColor(Int(arc4random_uniform(256)),Int(arc4random_uniform(256)),Int(arc4random_uniform(256)))
    }
    
    convenience init(_ r:Int,_ g:Int,_ b:Int,a:CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0,alpha: a)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        let a = alpha
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
}
