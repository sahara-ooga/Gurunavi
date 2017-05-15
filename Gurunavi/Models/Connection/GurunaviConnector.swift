//
//  GurunaviConnector.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GurunaviConnector :GurunaviFetcherDelegate{
    var delegate:GurunaviConnectorDelegate?
    
    func fetchGurunaviJSON(url:String) {
        //urlを元に、JSONを取得
        var gurunaviFetcher = GurunaviFetcher()
        gurunaviFetcher.delegate = self
        gurunaviFetcher.startToFetchJSON(url: url)
    }
    
    /// デリゲートメソッド.FetcherがAPIからJSONを取得した際に呼ばれる
    ///
    /// - Parameters:
    ///   - gurunaviFetcher: <#gurunaviFetcher description#>
    ///   - responseJSON: ぐるなびAPIから取得したJSON
    func gurunaviFetcher(_ gurunaviFetcher: GurunaviFetcher,
                         responseJSON: Any) {
        var array = [Restaurant]()
        
        //各JSON毎にモデルクラスを生成
        let json = JSON(responseJSON)
        let json2 = json["rest"]

        json2.forEach{(_,json3) in
            array.append(Restaurant(json: json3))
        }
        
        //デリゲート先にモデルクラスの配列を渡す
        delegate?.gurunaviConnector(self,
                                    restaurantArray: array)
    }
}

protocol GurunaviConnectorDelegate {
    func gurunaviConnector(_ gurunaviConnector:GurunaviConnector,
                         restaurantArray:[Restaurant])
}
