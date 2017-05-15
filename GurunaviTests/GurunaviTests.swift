//
//  GurunaviTests.swift
//  GurunaviTests
//
//  Created by yogasawara@stv on 2017/05/10.
//  Copyright © 2017年 smart tech ventures. All rights reserved.
//

import XCTest
import Keys

@testable import Gurunavi

class GurunaviTests: XCTestCase {
    
    let dao:DaoRestaurants = DaoRestaurants.sharedInstance
    
    var expectation:XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.expectation = nil
        NotificationCenter.default.removeObserver(self)
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
        let downloadJSONExpectation: XCTestExpectation? =
            self.expectation(description: "download json")
        
        //FIXME:非同期処理のテストを書く
        let mock = GurunaviFetcherDelegateMock()
        mock.expectation = downloadJSONExpectation
        
        //値を突き合わせる・空でないことを確かめる
        var fetcher = GurunaviFetcher()
        fetcher.delegate = mock
        fetcher.startToFetchJSON(url: url())
        
        waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    func testGenerateRestaurantModel() {
        //プロジェクト内に用意した、単一のお店情報のJSONファイルを取ってくる
        //let restaurantJSON = "restaurant".json() でも取得できる
        let restaurantJSONData = FileOrganizer.open(json: "restaurant")
        
        //モデルをJSONファイルから生成してプロパティの値を比較する
        let restaurant = Restaurant(data: restaurantJSONData)
        XCTAssertEqual(restaurant.name,"隠れ家個室居酒屋 鳥の利久 八重洲口店")
        XCTAssertEqual(restaurant.nearestStation,"ＪＲ東京駅")
        XCTAssertEqual(restaurant.walkDuration,"徒歩3分")
        XCTAssertEqual(restaurant.address,"〒104-0028 東京都中央区八重洲2-1-4 松勇八重洲ビル7F")
        XCTAssertEqual(restaurant.telNum,"050-3462-6007")
        XCTAssertEqual(restaurant.budget,"3000")
        XCTAssertEqual(restaurant.imageURL,"https://uds.gnst.jp/rest/img/b101sy2y0000/t_0000.jpg")
    }
    
    func testConnectorToFetch() {

        let fetchExpectation = self.expectation(description: "fetch json")

        let mock = ConnectorDelegateMock()
        mock.completionHandler = {fetchExpectation.fulfill()}
        
        var gurunaviConnector = GurunaviConnector()
        gurunaviConnector.delegate = mock
        gurunaviConnector.fetchGurunaviJSON(url: url())
        
        waitForExpectations(timeout: 30.0,
                            handler:nil)
    }
    
    func testDaoToFetch() {
        self.expectation = self.expectation(description: "receive restaurant info")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(daoDidReceiveInfo(notification:)),
                                               name: NSNotification.Name(rawValue: Constants.NotificationName.didReceiveRestaurantInfo),
                                               object: nil)
        
        dao.fetchRestaurantInfo(url: url())
        
        waitForExpectations(timeout: 30.0,
                            handler:nil)
    }
    
    func daoDidReceiveInfo(notification:Notification) {
        self.expectation?.fulfill()
        //試しに取得した情報を表示してみる
        debugPrint(self.dao.array[10].name)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func url() -> String {
        let keys = GurunaviKeys()
        
        return "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=" + keys.secretKeyID +  "&format=json&areacode_l=AREAL2169&hit_per_page=50&offset_page=1"
    }

}

class ConnectorDelegateMock:GurunaviConnectorDelegate{
    
    var array = [Restaurant]()
    var completionHandler:()->Void
    
    init() {
        array = [Restaurant]()
        completionHandler = {Void in return}
    }
    
    func gurunaviConnector(_ gurunaviConnector: GurunaviConnector, restaurantArray: [Restaurant]) {
        self.array = restaurantArray
        XCTAssertEqual(self.array.count, 50)
        
        //配列からランダムに選んだ1個が要素を持っているか調べる
        let random = (Int)(arc4random_uniform(50))
        let restaurant = self.array[random]
        XCTAssertNotNil(restaurant.name)
        XCTAssertNotNil(restaurant.nearestStation)
        XCTAssertNotNil(restaurant.walkDuration)
        XCTAssertNotNil(restaurant.address)
        XCTAssertNotNil(restaurant.telNum)
        XCTAssertNotNil(restaurant.budget)
        XCTAssertNotNil(restaurant.imageURL)
        
        completionHandler()
    }
    
}
