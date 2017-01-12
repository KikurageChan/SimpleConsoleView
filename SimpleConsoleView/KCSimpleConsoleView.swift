//
//  KCSimpleConsoleView.swift
//  KCSimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

final class KCSimpleConsoleView: UIView {
    class var getInstance : KCSimpleConsoleView {
        struct Static {
            static let instance : KCSimpleConsoleView = KCSimpleConsoleView()
        }
        return Static.instance
    }
    
    private(set) var screenSize: CGSize!
    private(set) var defaultFrame: CGRect!
    private(set) var hidePoint: CGPoint!
    private(set) var minSize: CGSize!
    
    @IBOutlet weak var hideButton: HideButton!
    @IBOutlet weak var swipeableView: SwipeableView!
    @IBOutlet weak var textView: UITextView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private init() {
        screenSize = UIScreen.main.bounds.size
        defaultFrame = CGRect(x: 0, y: screenSize.height - 150, width: screenSize.width, height: 150)
        minSize = CGSize(width: UIScreen.main.bounds.width, height: 44)
        hidePoint = CGPoint(x: 0, y: screenSize.height - minSize.height)
        super.init(frame: defaultFrame)
        let view = Bundle.main.loadNibNamed("KCSimpleConsoleView", owner: self, options: nil)?.first as! UIView
        autoresizesSubviews = true
        view.frame = bounds
        addSubview(view)
        becomeFirstResponder()
        swipeableView.delegate = self
    }
    
    @IBAction func hideAction(_ sender: Any) {
        if !hideButton.isPressed {
            //隠れていなかったら
            hideButton.isPressed = true
            UIView.animate(withDuration: 0.5) {
                self.frame = CGRect(origin: self.hidePoint, size: self.minSize)
            }
        }else {
            //隠れていたら
            hideButton.isPressed = false
            UIView.animate(withDuration: 0.5) {
                self.frame = self.defaultFrame
            }
        }
    }
    
    @IBAction func trashAction(_ sender: Any) {
        textView.text = ""
    }
    
    func display(_ text: String, isBR: Bool) {
        textView.text = textView.text + text
        if isBR { textView.text = textView.text + "\n" }
        textView.contentOffset = CGPoint(x: 0, y: textView.contentSize.height - textView.frame.size.height)
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            isHidden = !isHidden
        }
    }
}

extension KCSimpleConsoleView: SwipeableViewDelegate {
    
    func swipe(vertical d: CGFloat) {
        //上に行き過ぎの場合
        if frame.origin.y + d < minSize.height { return }
        //下に行き過ぎの場合
        if frame.origin.y + d > UIScreen.main.bounds.height - minSize.height { return }
        frame.origin.y += d
        frame.size.height -= d
        hideButton.isPressed = frame.size.height <= minSize.height
    }
}


