//
//  KCSimpleCnosoleViewExt.swift
//  KCSimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func SCPrint<T: CustomStringConvertible>(_ item: T) {
        let consoleView = SimpleConsoleView.getInstance
        view.addSubview(consoleView)
        consoleView.display(item.description)
    }
    
    func SCPrintln<T: CustomStringConvertible>(_ item: T) {
        let consoleView = SimpleConsoleView.getInstance
        view.addSubview(consoleView)
        consoleView.display(atNewLine: item.description)
    }
}
