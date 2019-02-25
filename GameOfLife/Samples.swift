//
//  Samples.swift
//  GameOfLife
//
//  Created by Thomas Hazlett on 25/02/2019.
//  Copyright © 2019 Thomas Hazlett. All rights reserved.
//

import Foundation

class Samples {
    //All samples are based around an origin of 0,0
    //This allows easy mapping to other coordinates
    
    static var glider : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(1,0))
            collection.insert(Cell(2,1))
            collection.insert(Cell(2,2))
            collection.insert(Cell(1,2))
            collection.insert(Cell(0,2))
            return collection
        }
    }
    
    
    static var smallExploder : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(1,0))
            collection.insert(Cell(0,1))
            collection.insert(Cell(1,1))
            collection.insert(Cell(2,1))
            collection.insert(Cell(0,2))
            collection.insert(Cell(2,2))
            collection.insert(Cell(1,3))
            return collection
        }
    }
    
    
    static var exploder : Set<Cell> {
        get {
            var collection = Set<Cell>()
            collection.insert(Cell(2,0))
            collection.insert(Cell(2,4))
            collection.insert(Cell(0,0))
            collection.insert(Cell(0,1))
            collection.insert(Cell(0,2))
            collection.insert(Cell(0,3))
            collection.insert(Cell(0,4))
            collection.insert(Cell(4,0))
            collection.insert(Cell(4,1))
            collection.insert(Cell(4,2))
            collection.insert(Cell(4,3))
            collection.insert(Cell(4,4))
            return collection
        }
    }
    
    
    static func rowOf(_ x: Int) -> Set<Cell> {
        var collection = Set<Cell>()
        for x in 0..<x {
            collection.insert(Cell(x,0))
        }
        return collection
    }
    
    
    static func rectOf(width: Int, height: Int) -> Set<Cell> {
        var collection = Set<Cell>()
        for x in 0..<width {
            collection.insert(Cell(x,height-1))
            collection.insert(Cell(x,0))
            
        }
        for y in 0..<height {
            collection.insert(Cell(0,y))
            collection.insert(Cell(width-1,y))
        }
        
        return collection
    }
    
    
    static func filledRectOf(width: Int, height: Int) -> Set<Cell> {
        var collection = Set<Cell>()
        for y in 0..<height {
            for x in 0..<width {
                collection.insert(Cell(x,y))
            }
        }
        return collection
    }
    
}
