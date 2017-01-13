//
//  ViewController.swift
//  SimpleConsoleView
//
//  Created by 木耳ちゃん on 2017/01/12.
//  Copyright © 2017年 木耳ちゃん. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kikurageAction(_ sender: Any) {
        SCprintln("木耳ちゃん")
    }
    
    @IBAction func alphaAction(_ sender: Any) {
        SCprint(view)
    }
    
    @IBAction func action(_ sender: Any) {
        SCprintln("LOVE")
    }
}
