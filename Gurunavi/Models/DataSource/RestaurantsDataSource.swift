//
//  RestaurantsDataSource.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit

class RestaurantsDataSource: NSObject,UITableViewDataSource {
    var daoRestaurants = DaoRestaurants.sharedInstance
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return daoRestaurants.restaurantArray.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantTableViewCell.self),
                                              for: indexPath) as? RestaurantTableViewCell
    
     cell?.setAppearance(restaurant: daoRestaurants.restaurantArray[indexPath.row])
     return cell!
        
    }
}
