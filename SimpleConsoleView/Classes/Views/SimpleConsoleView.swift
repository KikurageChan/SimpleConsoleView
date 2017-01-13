//
//  SimpleConsoleView.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

final public class SimpleConsoleView: UIView {
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
    
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var hideButton: HideButton!
    @IBOutlet weak var dotImageView: DotImageView!
    @IBOutlet weak var swipeableView: SwipeableView!
    @IBOutlet weak var trashButton: TrashButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var toolBar: UIView!
    
    public static var backColor = UIColor.white {
        didSet { getInstance.textView.backgroundColor = backColor }
    }
    public static var barColor = UIColor(hex: 0xEBEBF1) {
        didSet { getInstance.toolBar.backgroundColor = barColor }
    }
    public static var barLineColor = UIColor(hex: 0x979797) {
        didSet {
            getInstance.topLineView.backgroundColor = barLineColor
            getInstance.bottomLineView.backgroundColor = barLineColor
        }
    }
    public static var barTintColor = UIColor(hex: 0x979797) {
        didSet {
            getInstance.hideButton.tintColor = barTintColor
            getInstance.dotImageView.tintColor = barTintColor
            getInstance.trashButton.tintColor = barTintColor
        }
    }
    public static var textColor = UIColor.black {
        didSet { getInstance.textView.textColor = textColor }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private init() {
        screenSize = UIScreen.main.bounds.size
        defaultFrame = CGRect(x: 0, y: screenSize.height - 150, width: screenSize.width, height: 150)
        minSize = CGSize(width: UIScreen.main.bounds.width, height: 44)
        hideFrame = CGRect(origin: CGPoint(x: 0, y: screenSize.height - minSize.height), size: minSize)
        lastFrame = defaultFrame
        super.init(frame: defaultFrame)
        let pod = Bundle(for: self.classForCoder)
        let path = pod.path(forResource: "SimpleConsoleView", ofType: "bundle")!
        let bundle = Bundle(path: path)
        let view = UINib(nibName: "SimpleConsoleView", bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
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
    
    public func display(_ text: String) {
        textView.text = textView.text + text
        if textView.frame.size.height <= textView.sizeThatFits(textView.frame.size).height {
            textView.contentOffset = CGPoint(x: 0, y: textView.contentSize.height - textView.frame.size.height)
        }
    }
    
    public func display(atNewLine text: String) {
        textView.text = textView.text + text
        if textView.frame.size.height <= textView.sizeThatFits(textView.frame.size).height {
            textView.contentOffset = CGPoint(x: 0, y: textView.contentSize.height - textView.frame.size.height)
        }
        textView.text = textView.text + "\n"
    }
    
    override public var canBecomeFirstResponder: Bool {
        return true
    }
    
    override public func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
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
