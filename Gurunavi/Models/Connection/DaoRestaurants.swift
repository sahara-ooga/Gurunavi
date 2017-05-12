//
//  DaoRestaurants.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit

class DaoRestaurants: NSObject,GurunaviConnectorDelegate {

    var array = [Restaurant]()
    static let sharedInstance = DaoRestaurants()
    
    func fetchRestaurantInfo(url:String) {
        var connector = GurunaviConnector()
        connector.delegate = self
        connector.fetchGurunaviJSON(url: url)
    }
    
    func gurunaviConnector(_ gurunaviConnector: GurunaviConnector,
                           restaurantArray: [Restaurant]) {
        self.array = restaurantArray
        
        //TODO:読み込みの処理の終了
        //TODO:VCの表示処理など、次の処理へのトリガー
        let notification = Notification(name: Notification.Name(rawValue: Constants.NotificationName.didReceiveRestaurantInfo),
                                        object: self,
                                        userInfo: nil)
        NotificationCenter.default.post(notification)
    }
}
