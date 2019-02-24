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
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.handler = Handler(cells: Handler.rowOfTen)
        
        self.timer = Timer.init(timeInterval: 0.5, target: self, selector: #selector(ViewController.endTurn), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        
        
    }

    var previousStates = Set<String>()
    @objc func endTurn() {
        self.handler.endTurn()
        let state = self.handler.description()
        guard self.previousStates.insert(state).inserted else {
            self.timer?.invalidate()
            print("Run completed")
            return
        }
        
        print(state)
    }
    
    
    
}

