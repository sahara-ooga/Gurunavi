//
//  AreaDataSource.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit
import SwiftyJSON

class AreaDataSource:NSObject, UITableViewDataSource {

    var areas = [String]()
    
    override init() {
        super.init()
        
        areas = areaNames()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AreaTableViewCell.self),
                                                 for: indexPath) as! AreaTableViewCell
        cell.setCell(areaName: areas[indexPath.row])
        
        return cell
    }
    
    func areaNames()-> [String] {
        var areaNameArray = [String]()
        
        let json = JSONParser.parse(name: "area")
        let areaJSON = json["garea_large"]
        
        for area in areaJSON {
            //"pref_code"を指定して東京都に絞り込む
            let prefCode = area.1["pref"]["pref_code"]
            if prefCode == "PREF13" {
                areaNameArray.append(area.1["areaname_l"].stringValue)
            }
        }
        
        return areaNameArray
    }
}
