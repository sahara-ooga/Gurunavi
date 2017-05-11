//
//  JSONParser.swift
//  Gurunavi
//
//  Created by yuu ogasawara on 2017/05/11.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct JSONParser {
    func parse(jsonData:Data) -> JSON {
        return JSON(data:jsonData)
    }
}
