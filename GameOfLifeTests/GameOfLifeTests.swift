//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by Thomas Hazlett on 23/02/2019.
//  Copyright © 2019 Thomas Hazlett. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testCompareCell() {
        let newCell = Cell(1,1)
        let newCell2 = Cell(1,2)
        let newCell3 = Cell(1,1)
        
        XCTAssertFalse(newCell == newCell2)
        XCTAssertTrue(newCell == newCell3)
    }
    
    func testSurvival() {
        
    }
    
    func testReproduction() {
        
    }
}
