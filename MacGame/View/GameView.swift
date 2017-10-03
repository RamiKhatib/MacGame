//
//  GameView.swift
//  MacGame
//
//  Created by Rami Khatib on 01.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa
import SpriteKit

class GameView: SKView {
        
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func viewDidMoveToWindow() {
        // Show dev help information
        ignoresSiblingOrder = true
        showsFPS = true
        showsNodeCount = true
        // Present the scene
        presentScene(GameScene())
    }
    
}
