//
//  Constants.swift
//  Gurunavi
//
//  Created by yuu ogasawara on 2017/05/12.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
// 参考：http://stackoverflow.com/questions/26252233/global-constants-file-in-swift

import UIKit

struct Constants {
    struct JSONKey {
        static let name = "name"
        static let access = "access"
        static let line = "line"
        static let station = "station"
        static let station_exit = "station_exit"
        static let walk = "walk"
        static let address = "address"
        static let tel = "tel"
        static let budget = "budget"
        static let image_url = "image_url"
        static let shop_image1 = "shop_image1"
        
        //JSONのキーではないものの、便宜上まとめた値を呼び出す際に使う
        static let nearestStation = "nearestStation"
        static let imageURL = "imageURL"
    }
    
    struct NotificationName {
        static let didReceiveRestaurantInfo = "didReceiveRestaurantInfo"
        
    }
    
    static let kHeightForRow:CGFloat = 400.0
}
