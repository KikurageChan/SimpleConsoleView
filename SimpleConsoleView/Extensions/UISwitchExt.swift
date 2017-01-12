//
//  UISwitchExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/11/19.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation
import UIKit

extension UISwitch {
    public func setOnTintColor(color: UIColor?, duration: TimeInterval?, completion:(()->())? = nil) {
        if !isOn{
            self.onTintColor = color
            return
        }
        UIView.transition(with: self, duration: duration ?? 0, options: [.transitionCrossDissolve,.allowUserInteraction], animations: {
            self.onTintColor = color
        }) { (finish) in
            if finish { completion?() }
        }
    }
}
