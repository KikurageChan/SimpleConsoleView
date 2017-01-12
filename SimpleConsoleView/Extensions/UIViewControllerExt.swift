//
//  UIViewControllerExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/11/27.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInstantiatable {}

extension UIViewController: StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {
    /**
     命名に注意してください
     ```
     //   Storyboard:Main.storyboard
     //   Identifier:Main
     //        Class:MainViewController.swift
     ```
     */
    static func instantiate() -> Self {
        let fileName = self.className.replace(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: fileName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: fileName) as! Self
    }
}

