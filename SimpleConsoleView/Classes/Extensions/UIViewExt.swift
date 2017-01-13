//
//  UIViewExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/11/29.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func fadeIn(duration: TimeInterval = 0.2, completed: (() -> ())? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: duration,animations: {
            self.alpha = 1
        }) { finished in
            completed?()
        }
    }
    
    func fadeOut(duration: TimeInterval = 0.2, completed: (() -> ())? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }) { finished in
            self.isHidden = true
            self.alpha = 1
            completed?()
        }
    }
}
