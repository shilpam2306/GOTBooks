//
//  GTBooksSeriesViewModelTest.swift
//  GTBookSeriesTests
//
//  Created by Shilpa M on 12/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import XCTest
@testable import GTBookSeries

class GTBooksSeriesViewModelTest: XCTestCase {
    var sut : GTBooksSeriesViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GTBooksSeriesViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testcallFuncToGetEmpData() {
        sut.callFuncToGetEmpData()
        XCTAssertNotNil(sut.sourcesURL)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

