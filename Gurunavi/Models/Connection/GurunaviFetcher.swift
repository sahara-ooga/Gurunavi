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
    
    //TODO: コメントアウトの処理
    func startToFetchJSON(url:URLConvertible){
        Alamofire.request(url).responseJSON { response in
            if let JSON = response.result.value {
                self.manageResponseJSON(JSON: JSON)
            }
        }
    }
    
    func manageResponseJSON(JSON:Any) {
        delegate?.gurunaviFetcher(self, responseJSON: JSON)
    }
}


protocol GurunaviFetcherDelegate {
    func gurunaviFetcher(_ gurunaviFetcher:GurunaviFetcher,
                         responseJSON:Any)
}
