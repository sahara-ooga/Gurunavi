//
//  ViewController.swift
//  Gurunavi
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let areaDataSource = AreaDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = areaDataSource
        
        registerNibs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func registerNibs() {
        self.tableView.register(UINib.init(nibName: String(describing: AreaTableViewCell.self),
                                           bundle: nil),
                                forCellReuseIdentifier: String(describing: AreaTableViewCell.self))
    }
}

