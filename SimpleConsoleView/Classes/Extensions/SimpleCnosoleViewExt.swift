//
//  SimpleCnosoleViewExt.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    public func SCprint<T: CustomStringConvertible>(_ item: T) {
        let consoleView = SimpleConsoleView.getInstance
        view.addSubview(consoleView)
        view.bringSubview(toFront: consoleView)
        consoleView.display(item.description)
    }
    
    public func SCprintln<T: CustomStringConvertible>(_ item: T) {
        let consoleView = SimpleConsoleView.getInstance
        view.addSubview(consoleView)
        view.bringSubview(toFront: consoleView)
        consoleView.display(atNewLine: item.description)
    }
}
