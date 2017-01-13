//
//  ViewController.swift
//  Test
//
//  Created by 木耳ちゃん on 2017/01/13.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit
import SimpleConsoleView

class ViewController: UIViewController {

    override func viewDidLoad() {
        SimpleConsoleView.backColor = UIColor.red
        SCprintln("hello world")
        super.viewDidLoad()
        SCprint("Hello")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

