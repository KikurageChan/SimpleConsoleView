//
//  TrashButton.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/13.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

final class TrashButton: UIButton {

    var trashImage = UIImage(named: "trash", in: Bundle(for: DotImageView.self), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setImage(trashImage, for: .normal)
        tintColor = UIColor(hex: 0x979797)
    }
}
