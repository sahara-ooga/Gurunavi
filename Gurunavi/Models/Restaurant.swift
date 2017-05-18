//
//  Restaurant.swift
//  Gurunavi
//
//  Created by yuu ogasawara on 2017/05/12.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit
import SwiftyJSON

class Restaurant{
    //NOTE:参考のため、JSONから生成したプロパティを残しておく
//    var attributes : @attribute!
//    var access : Acces!
//    var address : String!
//    var budget : String!
//    var category : String!
//    var code : Code!
//    var couponUrl : CouponUrl!
//    var creditCard : String!
//    var eMoney : Note!
//    var fax : Note!
//    var flags : Flag!
//    var holiday : String!
//    var id : String!
//    var imageUrl : String!
//    var latitude : String!
//    var longitude : String!
//    var lunch : String!
//    var name : String!
//    var nameKana : String!
//    var opentime : String!
//    var parkingLots : Note!
//    var party : String!
//    var pr : Pr!
//    var tel : String!
//    var telSub : String!
//    var updateDate : String!
//    var url : String!
//    var urlMobile : String!
    
    var name : String
    var nearestStation : String
    var walkDuration : String
    var address : String
    var telNum : String
    var budget : String
    var imageURL : String?
    
    convenience init(_ data:Data) {
        let json = JSON(data)
        self.init(json)
    }
    
    convenience init(_ json:JSON) {
        var dictionary = [String:String]()
        dictionary[Constants.JSONKey.name] = json[Constants.JSONKey.name].string ?? "noname"
        
        //最寄り駅は鉄道会社・駅名・出口名をあわせたもので表示する
        let line:String = json[Constants.JSONKey.access][Constants.JSONKey.line].string ?? ""
        let station:String = json[Constants.JSONKey.access][Constants.JSONKey.station].string ?? ""
        let stationExit:String = json[Constants.JSONKey.access][Constants.JSONKey.station_exit].string ?? ""
        dictionary[Constants.JSONKey.nearestStation] = line + station + stationExit
        
        //"3"のように数字だけが返ってくるので、"徒歩3分"のようにする
        let walkMin = json[Constants.JSONKey.access][Constants.JSONKey.walk].string
        dictionary[Constants.JSONKey.walk] = (walkMin != nil) ? "徒歩" + walkMin! + "分" : ""
        
        dictionary[Constants.JSONKey.address] = json[Constants.JSONKey.address].string ?? ""
        dictionary[Constants.JSONKey.tel] = json[Constants.JSONKey.tel].string ?? ""
        dictionary[Constants.JSONKey.budget] = json[Constants.JSONKey.budget].string ?? ""
        dictionary[Constants.JSONKey.imageURL] = json[Constants.JSONKey.image_url][Constants.JSONKey.shop_image1].string ?? ""
        
        //辞書から生成
        self.init(dictionary)
    }
    
    init(_ dictionary: [String:String]){
        self.name = dictionary[Constants.JSONKey.name] ?? "noname"
        self.nearestStation = dictionary[Constants.JSONKey.nearestStation] ?? ""
        self.walkDuration = dictionary[Constants.JSONKey.walk] ?? ""
        self.address = dictionary[Constants.JSONKey.address] ?? ""
        self.telNum = dictionary[Constants.JSONKey.tel] ?? ""
        self.budget = dictionary[Constants.JSONKey.budget] ?? ""
        self.imageURL = dictionary[Constants.JSONKey.imageURL]
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    /*
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if attributes != nil{
            dictionary["@attributes"] = attributes.toDictionary()
        }
        if access != nil{
            dictionary["access"] = access.toDictionary()
        }
        if address != nil{
            dictionary["address"] = address
        }
        if budget != nil{
            dictionary["budget"] = budget
        }
        if category != nil{
            dictionary["category"] = category
        }
        if code != nil{
            dictionary["code"] = code.toDictionary()
        }
        if couponUrl != nil{
            dictionary["coupon_url"] = couponUrl.toDictionary()
        }
        if creditCard != nil{
            dictionary["credit_card"] = creditCard
        }
        if eMoney != nil{
            dictionary["e_money"] = eMoney.toDictionary()
        }
        if fax != nil{
            dictionary["fax"] = fax.toDictionary()
        }
        if flags != nil{
            dictionary["flags"] = flags.toDictionary()
        }
        if holiday != nil{
            dictionary["holiday"] = holiday
        }
        if id != nil{
            dictionary["id"] = id
        }
        if imageUrl != nil{
            dictionary["image_url"] = imageUrl.toDictionary()
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if lunch != nil{
            dictionary["lunch"] = lunch
        }
        if name != nil{
            dictionary["name"] = name
        }
        if nameKana != nil{
            dictionary["name_kana"] = nameKana
        }
        if opentime != nil{
            dictionary["opentime"] = opentime
        }
        if parkingLots != nil{
            dictionary["parking_lots"] = parkingLots.toDictionary()
        }
        if party != nil{
            dictionary["party"] = party
        }
        if pr != nil{
            dictionary["pr"] = pr.toDictionary()
        }
        if tel != nil{
            dictionary["tel"] = tel
        }
        if telSub != nil{
            dictionary["tel_sub"] = telSub
        }
        if updateDate != nil{
            dictionary["update_date"] = updateDate
        }
        if url != nil{
            dictionary["url"] = url
        }
        if urlMobile != nil{
            dictionary["url_mobile"] = urlMobile
        }
        return dictionary
    }
 */
}
