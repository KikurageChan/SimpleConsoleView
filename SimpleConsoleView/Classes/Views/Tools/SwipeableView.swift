//
//  SwipeableView.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

protocol SwipeableViewDelegate: class {
    func touch()
    func swipe(vertical d: CGFloat)
}

final class SwipeableView: UIView {
    
    weak var delegate: SwipeableViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touch()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        let preDy = touchEvent.previousLocation(in: self.superview).y
        let newDy = touchEvent.location(in: self.superview).y
        let dy = newDy - preDy
        delegate?.swipe(vertical: dy)
    }
}
