//
//  ViewController.swift
//  KCSimpleConsoleView
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
        SCPrint("木耳ちゃん")
        print("木耳ちゃん")
    }
    
    @IBAction func alphaAction(_ sender: Any) {
        SCPrint(view)
        print(view)
    }
    
    @IBAction func action(_ sender: Any) {
        
    }
    
}

