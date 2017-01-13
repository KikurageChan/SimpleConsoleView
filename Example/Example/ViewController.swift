//
//  ViewController.swift
//  Example
//
//  Created by 木耳ちゃん on 2017/01/13.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit
import SimpleConsoleView

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SCprintln("Hello world")
        
//        ---Color Setting---
//        SimpleConsoleView.backColor = UIColor.black
//        SimpleConsoleView.textColor = UIColor.black
//        SimpleConsoleView.barColor = UIColor.black
//        SimpleConsoleView.barLineColor = UIColor.black
//        SimpleConsoleView.barTintColor = UIColor.black

//        ---Other---
//        I'm Sorry... Current version does not support horizontal screen
    }

    @IBAction func apple(_ sender: Any) {
        SCprint("Apple")
    }
    
    @IBAction func cake(_ sender: Any) {
        SCprintln("Cake")
    }
    
    @IBAction func viewPrint(_ sender: Any) {
        SCprintln(self.view)
    }
}
