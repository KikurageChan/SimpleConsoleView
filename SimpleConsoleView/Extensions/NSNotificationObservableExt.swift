//
//  NSNotificationObservableExt.swift
//  Glasgow
//
//  Created by 木耳ちゃん on 2016/12/08.
//  Copyright © 2016年 NetGroup. All rights reserved.
//

import Foundation

protocol NSNotificationObservable: RawRepresentable {
    var rawValue: String { get }
}

extension NSNotificationObservable {
    func addObserver(_ observer: Any, selector: Selector, object: Any? = nil) {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: rawValue), object: object)
    }
    
    func addObserver(object: Any? = nil, queue: OperationQueue? = nil, usingBlock block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        let notificationCenter = NotificationCenter.default
        return notificationCenter.addObserver(forName: NSNotification.Name(rawValue: rawValue), object: object, queue: queue, using: block)
    }
  
    func post(object: Any?){
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: NSNotification.Name(rawValue: rawValue), object: object)
    }
    
    func post(object: Any?, userInfo: [AnyHashable : Any]?){
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: NSNotification.Name(rawValue: rawValue), object: object, userInfo: userInfo)
    }
}
