//
//  NSAttributedStringExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/10/12.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation

extension NSAttributedString {
    //前後のスペースを消去します
    func removeAroundSpace() -> NSAttributedString {
        return self.attributedStringByTrimmingCharacterSet(CharacterSet.whitespaces)
    }
    
    //前後の改行を消去します
    func removeAroundBR() -> NSAttributedString {
        return self.attributedStringByTrimmingCharacterSet(CharacterSet.newlines)
    }
    
    //前後の改行とスペースを消去します
    func removeAroundSpaceAndBR() -> NSAttributedString {
        return self.attributedStringByTrimmingCharacterSet(CharacterSet.whitespacesAndNewlines)
    }
    
    //NSMutableAttributedStringに変換して返します
    func toNSMutableAttributedString() -> NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
    //最初の1行を取得します
    func getOneLine()->NSAttributedString? {
        guard let n = self.string.splitBR().first?.characters.count else{
            return nil
        }
        return self.attributedSubstring(from: NSMakeRange(0, n))
    }
    
    //指定位置から始まる文字列を任意の長さだけ切り出します
    func subString(_ start:Int = 0,end:Int) -> NSAttributedString {
        return self.attributedSubstring(from: NSMakeRange(start, end))
    }
    
    func attributedStringByTrimmingCharacterSet(_ charSet: CharacterSet) -> NSAttributedString {
        let modifiedString = NSMutableAttributedString(attributedString: self)
        modifiedString.trimCharactersInSet(charSet)
        return NSAttributedString(attributedString: modifiedString)
    }
}
