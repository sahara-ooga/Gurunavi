//
//  RestaurantsViewController.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let restaurantsDataSource = RestaurantsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = restaurantsDataSource
        self.tableView.delegate = self
        registerNibs()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: - Notification
extension RestaurantsViewController {
    func whenDaoReceiveRestaurantInfo(notification:Notification) {
        //Daoがモデルオブジェクトを取得完了したので、表示の更新
        self.tableView.reloadData()
    }
    
    func registerNibs() {
        self.tableView.register(UINib.init(nibName: String(describing: RestaurantTableViewCell.self),
                                           bundle: nil),
                                forCellReuseIdentifier: String(describing: RestaurantTableViewCell.self))
    }
}

extension RestaurantsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.kHeightForRow
    }
}
