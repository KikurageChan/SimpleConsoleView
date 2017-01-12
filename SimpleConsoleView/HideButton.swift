//
//  HideButton.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

final class HideButton: UIButton {
    
    var upImage = UIImage(named: "Hide_up")
    var downImage = UIImage(named: "Hide_down")
    
    var isPressed = false {
        didSet {
            let image = isPressed ? upImage : downImage
            setImage(image, for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
