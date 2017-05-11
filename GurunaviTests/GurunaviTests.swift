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
    
    func testExample() {
        //テスト対象のJSONファイルを読み込む
        let path : String = Bundle.main.path(forResource: "area", ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : Data = fileHandle.readDataToEndOfFile() as Data
        
        let JSON = JSONParser().parse(jsonData: data)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
