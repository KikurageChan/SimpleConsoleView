//
//  StringExtension.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/10/09.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation

extension String {
    
    /**
     表示される実際の文字数を返します
     */
    var length:Int {
        return self.characters.count
    }
    
    /**
     絵文字など(2文字分)も含めた文字数を返します
     */
    var count:Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //テキストを引数のSeparateで分割して配列で返します
    func split(_ Separate:String) -> [String] {
        return self.components(separatedBy: Separate)
    }
    
    //1行ずつ分割して配列で返します
    func splitBR() -> [String] {
        var lines = [String]()
        self.enumerateLines { (line, stop) -> () in
            lines.append(line)
        }
        return lines
    }
    
    //前後の改行を消去します
    func removeAroundBR() -> String {
        return self.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    //前後の改行を消去します(自分自身が書きかわる)
    mutating func trimBR() {
        self = self.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    //前後のスペースを消去します
    func trimSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    //前後のスペースを消去します(自分自身が書きかわる)
    mutating func trimSpaceAtSelf() {
        self = self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    //前後の改行とスペースを消去します
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    //前後の改行とスペースを削除します(自分自身が書きかわる)
    mutating func trimAtSelf() {
        self = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    //文字列を置換します
    func replace(of: String, with: String) -> String {
        return self.replacingOccurrences(of: of, with: with)
    }
    
    //文字列を置換します(自分自身が書きかわる)
    mutating func replaceAtSelf(of: String, with: String) {
        self = self.replacingOccurrences(of: of, with: with)
    }
    
    //指定位置から始まる文字列を任意の長さだけ切り出します
    /**
     例を示します
     ```
     var text = "ABCDEFG"
     let ans = text.subString(start: 2,length: 3)
     //ans = "CDE"
     ```
     - parameter start:切り出す位置
     - parameter length:開始位置から何文字切り出すか
     
     - returns: 抜き出された文字列を返します
     */
    func subString(start: Int = 0, length: Int) -> String {
        let s = self.index(self.startIndex, offsetBy: start)
        let e = self.index(s, offsetBy: length)
        return self.substring(with: s ..< e)
    }
    
    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
    
    //正規表現の検索結果を利用できます
    func pregMatche(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.count)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count{
            for j in 0 ..< results[i].numberOfRanges{
                let range = results[i].rangeAt(j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }
    
    //正規表現の置換をします
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }
    
    //NSAttributeStringへ変換します
    func toNSAttributedString() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
}
