//
//  GurunaviFetcherDelegateMock.swift
//  Gurunavi
//
//  Created by yuu ogasawara on 2017/05/15.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit
import XCTest
import SwiftyJSON

class GurunaviFetcherDelegateMock: NSObject,GurunaviFetcherDelegate {

    var expectation:XCTestExpectation? = nil
    
    func gurunaviFetcher(_ gurunaviFetcher: GurunaviFetcher, responseJSON: Any) {
        var array = [Restaurant]()

        //実装
        let json = JSON(responseJSON)
        let json2 = json["rest"]
        json2.forEach{(_,json3) in
            array.append(Restaurant(json: json3))
            //辞書に詰めるか？参照→Restaurantクラス
        }
        
        let random = (Int)(arc4random_uniform(UInt32(array.count)))
        
        XCTAssert(array.count > 0)
        
        let restaurant = array[random]
        XCTAssertNotNil(restaurant.name)
        XCTAssertNotNil(restaurant.nearestStation)
        XCTAssertNotNil(restaurant.walkDuration)
        XCTAssertNotNil(restaurant.address)
        XCTAssertNotNil(restaurant.telNum)
        XCTAssertNotNil(restaurant.budget)
        XCTAssertNotNil(restaurant.imageURL)
        
        expectation?.fulfill()
    }
    
}
