//
//  Cell.swift
//  GameOfLife
//
//  Created by Thomas Hazlett on 23/02/2019.
//  Copyright © 2019 Thomas Hazlett. All rights reserved.
//

import Foundation


class Cell : Hashable{
    var xPos : Int
    var yPos: Int
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.xPos == rhs.xPos && lhs.yPos == rhs.yPos
    }
    
    init(_ x: Int, _ y: Int) {
        self.xPos = x
        self.yPos = y
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(xPos)
        hasher.combine(yPos)
    }
}
