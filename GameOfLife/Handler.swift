//
//  Handler.swift
//  GameOfLife
//
//  Created by Thomas Hazlett on 23/02/2019.
//  Copyright © 2019 Thomas Hazlett. All rights reserved.
//

import Foundation

class Handler {
    var cellCollection = Set<Cell>()
    
    init()  {
        print("\n ----- \n")
        print(self.description())
    }
    
    init(cells: Set<Cell>) {
        self.cellCollection = cells
        print("\n ----- \n")
        print(self.description())
    }
    
    func endTurn() {
        var newCollection = Set<Cell>()
        for cell in self.cellCollection {
            if(self.survival(cell: cell)) {
                newCollection.insert(cell)
            }
            for otherCell in self.neighbouringCellsTo(cell) {
                
                if(self.reproduction(potentialCell: otherCell)) {
                    newCollection.insert(otherCell)
                }
                
            }
        }
        
        self.cellCollection = newCollection
    }
    
    func neighbouringCellsTo( _ cell: Cell) -> Set<Cell> {
        var neighbouringCells = Set<Cell>()
        
        neighbouringCells.insert(Cell(cell.xPos-1, cell.yPos-1))
        neighbouringCells.insert(Cell(cell.xPos, cell.yPos-1))
        neighbouringCells.insert(Cell(cell.xPos+1, cell.yPos-1))
        
        neighbouringCells.insert(Cell(cell.xPos-1, cell.yPos))
        neighbouringCells.insert(Cell(cell.xPos+1, cell.yPos))
        
        neighbouringCells.insert(Cell(cell.xPos-1, cell.yPos+1))
        neighbouringCells.insert(Cell(cell.xPos, cell.yPos+1))
        neighbouringCells.insert(Cell(cell.xPos+1, cell.yPos+1))
        
        return neighbouringCells
    }
    
    func countLivingNeighboursOf( _ cell :Cell) -> Int {
        
        let neighbouringCells = self.neighbouringCellsTo(cell)
        var count = 0
        for otherCell in self.cellCollection {
            if(neighbouringCells.contains(otherCell)) {
                count += 1
            }
        }
        
        return count
    }
    
    func underPopulation(cell: Cell) -> Bool {
        return self.countLivingNeighboursOf(cell) < 2
    }
    
    func survival(cell: Cell) -> Bool {
        let count = self.countLivingNeighboursOf(cell)
        return count == 2 || count == 3
    }
    
    func overPopulation(cell: Cell) -> Bool {
        return self.countLivingNeighboursOf(cell) > 3
    }
    
    func reproduction(potentialCell cell : Cell) -> Bool {
        return self.countLivingNeighboursOf(cell) == 3
    }
    
    func description() -> String {
        guard self.cellCollection.count > 0 else {
            return "Game Over"
        }
        
        var minX : Int32 = Int32.max
        var maxX : Int32 = Int32.min
        var minY : Int32 = Int32.max
        var maxY : Int32 = Int32.min
        
        for cell in self.cellCollection {
            minX = min(minX, cell.xPos)
            minY = min(minY, cell.yPos)
            maxX = max(maxX, cell.xPos)
            maxY = max(maxY, cell.yPos)
        }
        
        var description = ""
        
        for y in minY...maxY {
            for x in minX...maxX {
                let cell = Cell(x, y)
                if(self.cellCollection.contains(cell)) {
                    description.append("# ")
                } else {
                    description.append("  ")
                }
            }
            description.append("\n")
        }
        
        description.append("\n ----- \n")
        
        return description
    }
    
    //MARK:-Sample Templates
    static var glider : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(0,0))
            collection.insert(Cell(1,1))
            collection.insert(Cell(1,2))
            collection.insert(Cell(0,2))
            collection.insert(Cell(-1,2))
            return collection
        }
    }
    static var smallExploder : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(0,0))
            collection.insert(Cell(-1,1))
            collection.insert(Cell(0,1))
            collection.insert(Cell(1,1))
            collection.insert(Cell(-1,2))
            collection.insert(Cell(1,2))
            collection.insert(Cell(0,3))
            return collection
        }
    }
    
    static var exploder : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(0,0))
            collection.insert(Cell(0,4))
            collection.insert(Cell(-2,0))
            collection.insert(Cell(-2,1))
            collection.insert(Cell(-2,2))
            collection.insert(Cell(-2,3))
            collection.insert(Cell(-2,4))
            collection.insert(Cell(2,0))
            collection.insert(Cell(2,1))
            collection.insert(Cell(2,2))
            collection.insert(Cell(2,3))
            collection.insert(Cell(2,4))
            return collection
        }
    }
    
    static var rowOfTen : Set<Cell> {
        get {
            var collection = Set<Cell>()
            for x:Int32 in 0..<10 {
                collection.insert(Cell(x,0))
            }
            return collection
        }
    }
}
