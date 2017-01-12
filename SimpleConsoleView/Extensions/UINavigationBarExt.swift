//
//  UINavigationBarExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/11/19.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    public func setBarTintColor(color: UIColor?, duration: TimeInterval?, completion:(()->())? = nil) {
        UIView.transition(with: self, duration: duration ?? 0, options: [.transitionCrossDissolve,.allowUserInteraction], animations: {
            self.barTintColor = color
        }) { (finish) in
            if finish { completion?() }
        }
    }
}
