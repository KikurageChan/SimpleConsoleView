//
//  KCSimpleConsoleView.swift
//  KCSimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

final class SimpleConsoleView: UIView {
    class var getInstance : SimpleConsoleView {
        struct Static {
            static let instance : SimpleConsoleView = SimpleConsoleView()
        }
        return Static.instance
    }
    
    private(set) var screenSize: CGSize!
    private(set) var defaultFrame: CGRect!
    private(set) var minSize: CGSize!
    private(set) var hideFrame: CGRect!
    private(set) var lastFrame: CGRect!
    private(set) var isAnimating = false
    
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
        hideFrame = CGRect(origin: CGPoint(x: 0, y: screenSize.height - minSize.height), size: minSize)
        lastFrame = defaultFrame
        super.init(frame: defaultFrame)
        let view = Bundle.main.loadNibNamed("SimpleConsoleView", owner: self, options: nil)?.first as! UIView
        autoresizesSubviews = true
        view.frame = bounds
        addSubview(view)
        becomeFirstResponder()
        swipeableView.delegate = self
    }
    
    @IBAction func hideAction(_ sender: Any) {
        if !hideButton.isPressed {
            //隠れていなかったら
            isAnimating = true
            hideButton.isPressed = true
            lastFrame = frame
            UIView.animate(withDuration: 0.5, animations: {
                self.frame.origin = self.hideFrame.origin
            }, completion: { finish in
                self.frame.size = self.hideFrame.size
                self.isAnimating = false
            })
        }else {
            //隠れていたら
            isAnimating = true
            hideButton.isPressed = false
            UIView.animate(withDuration: 0.5, animations: {
                self.frame = self.lastFrame
            }, completion: { finish in
                self.isAnimating = false
            })
        }
    }
    
    @IBAction func trashAction(_ sender: Any) {
        textView.text = ""
    }
    
    func display(_ text: String) {
        textView.text = textView.text + text
        if textView.frame.size.height <= textView.sizeThatFits(textView.frame.size).height {
            textView.contentOffset = CGPoint(x: 0, y: textView.contentSize.height - textView.frame.size.height)
        }
    }
    
    func display(atNewLine text: String) {
        textView.text = textView.text + text
        if textView.frame.size.height <= textView.sizeThatFits(textView.frame.size).height {
            textView.contentOffset = CGPoint(x: 0, y: textView.contentSize.height - textView.frame.size.height)
        }
        textView.text = textView.text + "\n"
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            isHidden ? fadeIn() : fadeOut()
        }
    }
}

extension SimpleConsoleView: SwipeableViewDelegate {
    func swipe(vertical d: CGFloat) {
        if isAnimating { return }
        //上に行き過ぎの場合
        if frame.origin.y + d < minSize.height { return }
        //下に行き過ぎの場合
        if frame.origin.y + d > UIScreen.main.bounds.height - minSize.height { return }
        frame.origin.y += d
        frame.size.height -= d
        hideButton.isPressed = frame.size.height <= minSize.height
    }
}


