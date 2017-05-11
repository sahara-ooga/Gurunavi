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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
