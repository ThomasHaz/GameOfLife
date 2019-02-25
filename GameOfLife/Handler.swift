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
    
    init(withCells cells: Set<Cell>) {
        self.cellCollection = cells
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
    
    //Cell will live
    func survival(cell: Cell) -> Bool {
        guard self.cellCollection.contains(cell) else {
            return false
        }
        let count = self.countLivingNeighboursOf(cell)
        return count == 2 || count == 3
    }
    
    //Cell will become alive
    func reproduction(potentialCell cell : Cell) -> Bool {
        guard (!self.cellCollection.contains(cell)) else {
            return false
        }
        return self.countLivingNeighboursOf(cell) == 3
    }
    
    //Cell is about to die
    func underPopulation(cell: Cell) -> Bool {
        return self.countLivingNeighboursOf(cell) < 2
    }
    
    //Cell is about to die
    func overPopulation(cell: Cell) -> Bool {
        return self.countLivingNeighboursOf(cell) > 3
    }
    
    var description : String {
        get {
            guard self.cellCollection.count > 0 else {
                return ""
            }
            
            var minX : Int = Int.max
            var maxX : Int = Int.min
            var minY : Int = Int.max
            var maxY : Int = Int.min
            
            for cell in self.cellCollection {
                minX = min(minX, cell.xPos)
                minY = min(minY, cell.yPos)
                maxX = max(maxX, cell.xPos)
                maxY = max(maxY, cell.yPos)
            }
            
            var description = ""
            
            for y in minY-1...maxY+1 {
                for x in minX-1...maxX+1 {
                    let cell = Cell(x, y)
                    if(self.cellCollection.contains(cell)) {
                        if(self.underPopulation(cell: cell)) {
                            //Will die next round
                            description.append("U ")
                        } else if (self.overPopulation(cell: cell)) {
                            //Will die next round
                            description.append("O ")
                        } else {
                            description.append("# ")
                        }
                    } else {
                        if(self.reproduction(potentialCell: cell)) {
                            description.append(". ")
                        } else {
                            description.append("  ")
                        }
                    }
                }
                description.append("\n")
            }
            
            return description
        }
    }
}
