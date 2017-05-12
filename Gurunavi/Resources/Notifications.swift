//
//  Notifications.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/13.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import Foundation

extension Notification{
    
    init(name:String,
         object:Any?,
         parameters:Any) {
        
        let userInfo = ["parameters" : parameters]
        
        self.init(name:Notification.Name(rawValue: name),
                  object:object,
                  userInfo:userInfo)
    }
    
    func parameters() -> Any? {
        return self.userInfo!["parameters"]
    }
    
}
