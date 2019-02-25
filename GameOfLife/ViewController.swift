//
//  ViewController.swift
//  GameOfLife
//
//  Created by Thomas Hazlett on 23/02/2019.
//  Copyright © 2019 Thomas Hazlett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var handler : Handler!
    
    private var _timer : Timer?
    var timer : Timer {
        get {
            if _timer == nil {
                _timer = Timer.init(timeInterval: 0.5, target: self, selector: #selector(ViewController.endTurn), userInfo: nil, repeats: true)
            }
            return _timer!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cells = Set(Samples.filledRectOf(width: 4, height: 3).map(
                { (Cell) -> Cell in
                    Cell.xPos += 3
                    return Cell
                }
            )
        ).union(
            Samples.filledRectOf(width: 2, height: 2)
        )
        
        self.handler = Handler(withCells: cells)
        
        print( self.prettyDescription(of: self.handler.description) )
        
        self.startStopTimer()
        
    }

    
    var previousStates = [String]()
    @objc func endTurn() {
        self.handler.endTurn()
        let state = self.handler.description
        
        if self.previousStates.contains(state) {
            self.startStopTimer()
            if(state == "") {
                print("Game Over")
                return
            } else {
                print("Repeating from: ")
                print( self.prettyDescription(of: state) )
            }
        } else {
            print( self.prettyDescription(of: state) )
        }
        
        self.previousStates.append(state)
    }
    
    
    @IBAction func startStopTimer() {
        if( !(_timer?.isValid ?? false) ) {
            //Start Timer
            RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
        } else {
            //Stop Timer
            self.timer.invalidate()
            _timer = nil
        }
    }
    
    
    private func prettyDescription(of state: String?) -> String {
        return "\n ----- \n\n\(state ?? "")\n ----- \n\n\n\n"
    }
    
}

