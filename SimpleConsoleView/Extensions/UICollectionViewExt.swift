//
//  UICollectionViewExt.swift
//  KikurageStudy
//
//  Created by 木耳ちゃん on 2016/12/06.
//  Copyright © 2016年 木耳ちゃん. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    /**
     以下の名前を同じにして利用します
     - xibファイル名
     - クラス名
     - identifier
     ---
     例を示します
     ```
     //登録
     collectionView.register(cellType: MyCell.self)
     //取り出し
     let cell = collectionView.dequeueReusableCell(with: MyCell.self, for: indexPath)
     ```
    */
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
