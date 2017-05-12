//
//  GurunaviFetcher.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import Foundation
import Alamofire

struct GurunaviFetcher {
    var delegate:GurunaviFetcherDelegate?
    
    func startToFetchJSON(url:URLConvertible){
        Alamofire.request(url).responseJSON { response in
//            debugPrint(response.request ?? "no request")  // original URL request
//            debugPrint(response.response ?? "no response") // HTTP URL response
//            debugPrint(response.data ?? "no data")     // server data
//            debugPrint(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                self.manageResponseJSON(JSON: JSON)
            }
        }
    }
    
    func manageResponseJSON(JSON:Any) {
        //debugPrint(JSON)
        delegate?.gurunaviFetcher(self, responseJSON: JSON)
    }
}


protocol GurunaviFetcherDelegate {
    func gurunaviFetcher(_ gurunaviFetcher:GurunaviFetcher,
                         responseJSON:Any)
}
