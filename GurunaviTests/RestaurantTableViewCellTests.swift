//
//  RestaurantTableViewCellTests.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/05/12.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import Gurunavi

class RestaurantTableViewCellTests: XCTestCase {

    var viewController:RestaurantsViewController!
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: RestaurantTableViewCell!
    let rest = Restaurant(data:(FileOrganizer.open(json:"restaurant")))

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "RestaurantsViewController",
                                      bundle: nil)
        
        viewController = storyboard
            .instantiateViewController(
                withIdentifier: "RestaurantsViewController")
            as! RestaurantsViewController

        //trigger viewDidLoad()
        _ = viewController.view

        tableView = viewController.tableView
        tableView?.dataSource = dataSource
        
        tableView.register(RestaurantTableViewCell.self,
                           forCellReuseIdentifier:String(describing: RestaurantTableViewCell.self)
        )
        
//        viewController.tableView.register(UINib(nibName: String(describing: RestaurantTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RestaurantTableViewCell.self))

        cell = tableView?.dequeueReusableCell(
            withIdentifier: String(describing: RestaurantTableViewCell.self),
            for: IndexPath(row: 0, section: 0)) as! RestaurantTableViewCell
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testNearestStationLabel() {
        var array = [UILabel]()
        
        //NOTE:cellのラベルがnilなので、各ラベルに生成したラベルを突っ込んでやる必要がある
        for _ in 1...5 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
            array.append(label)
        }

        self.configureCell(array)
        cell.setAppearance(restaurant:rest)
        XCTAssertEqual(cell.nearestStationLabel.text!, "ＪＲ東京駅 徒歩3分")
    }

    func testAddressLabel() {
        var array = [UILabel]()
        
        //NOTE:cellのラベルがnilなので、各ラベルに生成したラベルを突っ込んでやる必要がある
        for _ in 1...5 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
            array.append(label)
        }
        
        self.configureCell(array)
        cell.setAppearance(restaurant:rest)
        XCTAssertEqual(cell.addressLabel.text!, "〒104-0028 東京都中央区八重洲2-1-4 松勇八重洲ビル7F")
    }
    
    func testTelNumLabel() {
        var array = [UILabel]()
        
        //NOTE:cellのラベルがnilなので、各ラベルに生成したラベルを突っ込んでやる必要がある
        for _ in 1...5 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
            array.append(label)
        }
        
        self.configureCell(array)
        cell.setAppearance(restaurant:rest)
        XCTAssertEqual(cell.telNumLabel.text!, "050-3462-6007")
    }
    
    /// 予算は？
    func testSetBudgetNameLabel() {
        var array = [UILabel]()
        
        //NOTE:cellのラベルがnilなので、各ラベルに生成したラベルを突っ込んでやる必要がある
        for _ in 1...5 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
            array.append(label)
        }
        
        self.configureCell(array)
        cell.setAppearance(restaurant:rest)
        XCTAssertEqual(cell.budgetLabel.text!, "¥3,000")
    }
}

extension RestaurantTableViewCellTests {

    class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

extension RestaurantTableViewCellTests{
    
    func configureCell(_ array:[UILabel]) {
        cell.nameLabel = array[0]
        cell.nearestStationLabel = array[1]
        cell.addressLabel = array[2]
        cell.telNumLabel = array[3]
        cell.budgetLabel = array[4]
    }
    
}
