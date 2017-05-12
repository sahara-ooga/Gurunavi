//
//  GurunaviTests.swift
//  GurunaviTests
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import XCTest
@testable import Gurunavi

class GurunaviTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        let json = JSONParser.parse(name: "area")
        let areaJSON = json["garea_large"]
        XCTAssertNotNil(areaJSON)
        
        for area in areaJSON {
            //"pref_code"を指定して東京都に絞り込む
            let prefCode = area.1["pref"]["pref_code"]
            if prefCode == "PREF13" {
                return
            }
        }
        //もし東京都が無ければテスト失敗
        XCTFail()
    }
    
    func testAreaNames(){
        //FIXME:改善の余地あり
        let areaDataSource = AreaDataSource()
        let array = areaDataSource.areaNames()
        XCTAssertTrue(array.contains("銀座・有楽町・築地"))
    }
    
    func testFetchGotandaInfo() {
        //五反田近辺エリア・50件・最初の50件で検索
        let url = "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=1733cc471db89a76e4f199c411ec7673&format=json&areacode_l=AREAL2169&hit_per_page=50&offset_page=1"
        let _: XCTestExpectation? =
            self.expectation(description: "download json")
        
        //FIXME:非同期処理のテストを書く
        //値を突き合わせる・空でないことを確かめる
        let fetcher = GurunaviFetcher()
        fetcher.startToFetchJSON(url: url)
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    func testGenerateRestaurantModel() {
        //単一のお店情報のJSONファイルを取ってくる
        let restaurantJSONData = FileOrganizer.open(json: "restaurant")
        //let jsonfile = "restaurant".json()
        
        //モデルをJSONファイルから生成してプロパティの値を比較する
        let restaurant = Restaurant(json: restaurantJSONData)
        XCTAssertEqual(restaurant.name,"隠れ家個室居酒屋 鳥の利久 八重洲口店")
        XCTAssertEqual(restaurant.nearestStation,"ＪＲ東京駅")
        XCTAssertEqual(restaurant.walkDuration,"徒歩3分")
        XCTAssertEqual(restaurant.address,"〒104-0028 東京都中央区八重洲2-1-4 松勇八重洲ビル7F")
        XCTAssertEqual(restaurant.telNum,"050-3462-6007")
        XCTAssertEqual(restaurant.budget,"3000")
        XCTAssertEqual(restaurant.imageURL,"https://uds.gnst.jp/rest/img/b101sy2y0000/t_0000.jpg")

    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
