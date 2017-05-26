//
//  ViewController.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit
import Keys

class AreaViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dao:DaoRestaurants = DaoRestaurants.sharedInstance

    let areaDataSource = AreaDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUp(){
        tableView.dataSource = areaDataSource

        registerNibs()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(daoDidReceiveInfo(notification:)),
                                               name: NSNotification.Name(rawValue: Constants.NotificationName.didReceiveRestaurantInfo),
                                               object: nil)
    }
    
}

extension AreaViewController:UITableViewDelegate{
    //TODO:セルがタップされたときの処理
    // セルタップ時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        //FIXME:もちろんエリアごとにURLを変更する必要あり
        dao.fetchRestaurantInfo(url: url())
    }
}

extension AreaViewController{
    }
    
    func registerNibs() {
        self.tableView.register(UINib.init(nibName: String(describing: AreaTableViewCell.self),
                                           bundle: nil),
                                forCellReuseIdentifier: String(describing: AreaTableViewCell.self))
    }
    
    func url() -> String {
        let keys = GurunaviKeys()
        
        return "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=" + keys.secretKeyID +  "&format=json&areacode_l=AREAL2169&hit_per_page=50&offset_page=1"
    }
}
