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

    let c1 = Cell(1,-1)
    let c2 = Cell(2,-1)
    let c3 = Cell(0,0)
    let c4 = Cell(1,0)
    let c5 = Cell(2,0)
    let c6 = Cell(1,1)
    let c7 = Cell(1,2)
    let c8 = Cell(2,2)
    let c9 = Cell(0,3)
    let c10 = Cell(3,4)
    let cellNotInSet = Cell(10,10)
    
    let r1 = Cell(0,-1)
    let r2 = Cell(0, 2)
    let r3 = Cell(1, 3)
    let r4 = Cell(2, 3)
    
    
    //Round 2 Cells
    let qu1 = Cell(0,-1)
    let qu2 = Cell(2,-1)
    let qu3 = Cell(0,0)
    let qr1 = Cell(0,1)
    let q1 = Cell(0,2)
    let qo1 = Cell(1,2)
    let q2 = Cell(2,2)
    let qr2 = Cell(0,3)
    let qo2 = Cell(1,3)
    let q3 = Cell(2,3)
    
    var handler : Handler!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        /*
         | . O #
         ------------
         | # O O
         |   O
         | . # #
         | U . .
         |       U
         
         */
        
        self.handler = Handler(withCells: [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10])
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
    func testInitWithCells() {
        XCTAssertTrue(self.handler.cellCollection.contains(c1))
        XCTAssertTrue(self.handler.cellCollection.contains(c2))
        XCTAssertTrue(self.handler.cellCollection.contains(c3))
        XCTAssertTrue(self.handler.cellCollection.contains(c4))
        XCTAssertTrue(self.handler.cellCollection.contains(c5))
        XCTAssertTrue(self.handler.cellCollection.contains(c6))
        XCTAssertTrue(self.handler.cellCollection.contains(c7))
        XCTAssertTrue(self.handler.cellCollection.contains(c8))
        XCTAssertTrue(self.handler.cellCollection.contains(c9))
        XCTAssertTrue(self.handler.cellCollection.contains(c10))
        XCTAssertFalse(self.handler.cellCollection.contains(cellNotInSet))
    }
    
    func testUnderPopulation() {
        
        XCTAssertFalse(self.handler.underPopulation(cell: c1))
        XCTAssertFalse(self.handler.underPopulation(cell: c2))
        XCTAssertFalse(self.handler.underPopulation(cell: c3))
        XCTAssertFalse(self.handler.underPopulation(cell: c4))
        XCTAssertFalse(self.handler.underPopulation(cell: c5))
        XCTAssertFalse(self.handler.underPopulation(cell: c6))
        XCTAssertFalse(self.handler.underPopulation(cell: c7))
        XCTAssertFalse(self.handler.underPopulation(cell: c8))
        XCTAssertTrue(self.handler.underPopulation(cell: c9))
        XCTAssertTrue(self.handler.underPopulation(cell: c10))
        
        XCTAssertTrue(self.handler.underPopulation(cell: cellNotInSet))
        
        self.handler.endTurn()
        
        XCTAssertTrue(self.handler.underPopulation(cell: qu1))
        XCTAssertTrue(self.handler.underPopulation(cell: qu2))
        XCTAssertTrue(self.handler.underPopulation(cell: qu3))
        
        XCTAssertFalse(self.handler.underPopulation(cell: qr1))
        XCTAssertFalse(self.handler.underPopulation(cell: qr2))
        
        XCTAssertFalse(self.handler.underPopulation(cell: q1))
        XCTAssertFalse(self.handler.underPopulation(cell: q2))
        XCTAssertFalse(self.handler.underPopulation(cell: q3))
        
        XCTAssertFalse(self.handler.underPopulation(cell: qo1))
        XCTAssertFalse(self.handler.underPopulation(cell: qo2))
    }
    
    func testSurvival() {
        
        XCTAssertFalse(self.handler.survival(cell: c1))
        XCTAssertTrue(self.handler.survival(cell: c2))
        XCTAssertTrue(self.handler.survival(cell: c3))
        XCTAssertFalse(self.handler.survival(cell: c4))
        XCTAssertFalse(self.handler.survival(cell: c5))
        XCTAssertFalse(self.handler.survival(cell: c6))
        XCTAssertTrue(self.handler.survival(cell: c7))
        XCTAssertTrue(self.handler.survival(cell: c8))
        XCTAssertFalse(self.handler.survival(cell: c9))
        XCTAssertFalse(self.handler.survival(cell: c10))
        
        XCTAssertFalse(self.handler.survival(cell: cellNotInSet))
        
        self.handler.endTurn()
        
        XCTAssertFalse(self.handler.survival(cell: qu1))
        XCTAssertFalse(self.handler.survival(cell: qu2))
        XCTAssertFalse(self.handler.survival(cell: qu3))
        
        XCTAssertFalse(self.handler.survival(cell: qr1))
        XCTAssertFalse(self.handler.survival(cell: qr2))
        
        XCTAssertTrue(self.handler.survival(cell: q1))
        XCTAssertTrue(self.handler.survival(cell: q2))
        XCTAssertTrue(self.handler.survival(cell: q3))
        
        XCTAssertFalse(self.handler.survival(cell: qo1))
        XCTAssertFalse(self.handler.survival(cell: qo2))
    }

    func testOverpopulation() {
        /*
         |   O #
         ------------
         | # O O
         |   O
         |   # #
         | U
         |       U
         
         */
        
        XCTAssertTrue(self.handler.overPopulation(cell: c1))
        XCTAssertFalse(self.handler.overPopulation(cell: c2))
        XCTAssertFalse(self.handler.overPopulation(cell: c3))
        XCTAssertTrue(self.handler.overPopulation(cell: c4))
        XCTAssertTrue(self.handler.overPopulation(cell: c5))
        XCTAssertTrue(self.handler.overPopulation(cell: c6))
        XCTAssertFalse(self.handler.overPopulation(cell: c7))
        XCTAssertFalse(self.handler.overPopulation(cell: c8))
        XCTAssertFalse(self.handler.overPopulation(cell: c9))
        XCTAssertFalse(self.handler.overPopulation(cell: c10))
        
        XCTAssertFalse(self.handler.overPopulation(cell: cellNotInSet))
        
        
        
        self.handler.endTurn()
        
        XCTAssertFalse(self.handler.overPopulation(cell: qu1))
        XCTAssertFalse(self.handler.overPopulation(cell: qu2))
        XCTAssertFalse(self.handler.overPopulation(cell: qu3))
        
        XCTAssertFalse(self.handler.overPopulation(cell: qr1))
        XCTAssertFalse(self.handler.overPopulation(cell: qr2))
        
        XCTAssertFalse(self.handler.overPopulation(cell: q1))
        XCTAssertFalse(self.handler.overPopulation(cell: q2))
        XCTAssertFalse(self.handler.overPopulation(cell: q3))
        
        XCTAssertTrue(self.handler.overPopulation(cell: qo1))
        XCTAssertTrue(self.handler.overPopulation(cell: qo2))
    }
    
    func testReproduction() {
        /*
         | . O #
         ------------
         | # O O
         |   O
         | . # #
         | U . .
         |       U
         
         */
        
        
        
        XCTAssertTrue(self.handler.reproduction(potentialCell: r1))
        XCTAssertTrue(self.handler.reproduction(potentialCell: r2))
        XCTAssertTrue(self.handler.reproduction(potentialCell: r3))
        XCTAssertTrue(self.handler.reproduction(potentialCell: r4))
        
        XCTAssertFalse(self.handler.reproduction(potentialCell: c1))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c2))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c3))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c4))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c5))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c6))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c7))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c8))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c9))
        XCTAssertFalse(self.handler.reproduction(potentialCell: c10))
        
        XCTAssertFalse(self.handler.reproduction(potentialCell: cellNotInSet))
        
        self.handler.endTurn()
        
        XCTAssertFalse(self.handler.reproduction(potentialCell: qu1))
        XCTAssertFalse(self.handler.reproduction(potentialCell: qu2))
        XCTAssertFalse(self.handler.reproduction(potentialCell: qu3))
        
        XCTAssertTrue(self.handler.reproduction(potentialCell: qr1))
        XCTAssertTrue(self.handler.reproduction(potentialCell: qr2))
        
        XCTAssertFalse(self.handler.reproduction(potentialCell: q1))
        XCTAssertFalse(self.handler.reproduction(potentialCell: q2))
        XCTAssertFalse(self.handler.reproduction(potentialCell: q3))
        
        XCTAssertFalse(self.handler.reproduction(potentialCell: qo1))
        XCTAssertFalse(self.handler.reproduction(potentialCell: qo2))
        
        
    }
    
    func testEndTurn() {
        /*
         | . O #
         ------------
         | # O O
         |   O
         | . # #
         | U . .
         |       U
         
         */
        
        XCTAssertFalse(self.handler.cellCollection.contains(r1))
        XCTAssertFalse(self.handler.cellCollection.contains(r2))
        XCTAssertFalse(self.handler.cellCollection.contains(r3))
        XCTAssertFalse(self.handler.cellCollection.contains(r4))
        
        self.handler.endTurn()
        
        XCTAssertFalse(self.handler.cellCollection.contains(c1))
        XCTAssertTrue(self.handler.cellCollection.contains(c2))
        XCTAssertTrue(self.handler.cellCollection.contains(c3))
        XCTAssertFalse(self.handler.cellCollection.contains(c4))
        XCTAssertFalse(self.handler.cellCollection.contains(c5))
        XCTAssertFalse(self.handler.cellCollection.contains(c6))
        XCTAssertTrue(self.handler.cellCollection.contains(c7))
        XCTAssertTrue(self.handler.cellCollection.contains(c8))
        XCTAssertFalse(self.handler.cellCollection.contains(c9))
        XCTAssertFalse(self.handler.cellCollection.contains(c10))
        
        //Reproduced(New) cells
        XCTAssertTrue(self.handler.cellCollection.contains(r1))
        XCTAssertTrue(self.handler.cellCollection.contains(r2))
        XCTAssertTrue(self.handler.cellCollection.contains(r3))
        XCTAssertTrue(self.handler.cellCollection.contains(r4))
        
        XCTAssertTrue(self.handler.cellCollection.count == 8)
        
        
        /*
         //Round 2:
         | U   U
         ------------
         | U
         | .
         | # O #
         | . O #
         |
         
         */
        
        XCTAssertTrue(self.handler.cellCollection.contains(qu1))
        XCTAssertTrue(self.handler.cellCollection.contains(qu2))
        XCTAssertTrue(self.handler.cellCollection.contains(qu3))
        
        XCTAssertFalse(self.handler.cellCollection.contains(qr1))
        XCTAssertFalse(self.handler.cellCollection.contains(qr2))
        
        XCTAssertTrue(self.handler.cellCollection.contains(q1))
        XCTAssertTrue(self.handler.cellCollection.contains(q2))
        XCTAssertTrue(self.handler.cellCollection.contains(q3))
        
        XCTAssertTrue(self.handler.cellCollection.contains(qo1))
        XCTAssertTrue(self.handler.cellCollection.contains(qo2))
    }
    
    func testCountLivingNeighboursOf() {
        /*
         |   O #
         ------------
         | # O O
         |   O
         |   # #
         | U
         |       U
         
         */
        
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c1) == 4)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c2) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c3) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c4) == 5)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c5) == 4)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c6) == 5)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c7) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c8) == 2)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c9) == 1)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(c10) == 0)
        
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(r1) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(r2) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(r3) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(r4) == 3)
        
        
        /*
         //Round 2:
         | U   U
         ------------
         | U
         | .
         | # O #
         | . O #
         |
         
         */
        
        
        self.handler.endTurn()
        
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qu1) == 1)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qu2) == 0)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qu3) == 1)
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qr1) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qr2) == 3)
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(q1) == 2)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(q2) == 3)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(q3) == 3)
        
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qo1) == 4)
        XCTAssertTrue(self.handler.countLivingNeighboursOf(qo2) == 4)
        
        

        
    }
}
