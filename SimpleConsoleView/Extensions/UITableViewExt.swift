//
//  UITableViewExt.swift
//  KikurageStudy
//
//  Created by 木耳ちゃん on 2016/12/06.
//  Copyright © 2016年 木耳ちゃん. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    /**
     以下の名前を同じにして利用します
     - xibファイル名
     - クラス名
     - identifier
     ---
     例を示します
     ```
     //登録
     tableView.register(cellType: MyCell.self)
     //取り出し
     let cell = tableView.dequeueReusableCell(with: MyCell.self, for: indexPath)
     ```
    */
    func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
