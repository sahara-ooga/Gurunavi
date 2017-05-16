//
//  RestaurantsDataSource.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit

class RestaurantsDataSource: NSObject,UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let dao = DaoRestaurants.sharedInstance
        
        return dao.array.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantTableViewCell.self),
                                              for: indexPath) as? RestaurantTableViewCell
     
     cell?.setAppearance(restaurant: DaoRestaurants.sharedInstance.array[indexPath.row])
        
     return cell!
        
    }
    
}
