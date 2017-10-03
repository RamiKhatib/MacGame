//
//  GameScene.swift
//  MacGame
//
//  Created by Rami Khatib on 01.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa
import SpriteKit

class GameScene: SKScene {
    
    var gameWorld : GameWorld?
    var lastHoveredCell : SKSpriteNode? {
        willSet(value) {
            if let _ = value {
                value?.color = .white
            }
        }
        didSet(value){
            if let _ = value {
                value?.color = .darkGray
            }
        }
    }

    override init() {
        super.init(size: (NSScreen.main?.frame)!.size)
        // Set the scale mode to scale to fit the window
        scaleMode = .aspectFill
        // Set the color of the scene
        backgroundColor = .black
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ////////////////
        let _ = createWorld()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createWorld() -> String {
        if let _ = gameWorld {
            return "World already exist"
        } else {
            gameWorld = GameWorld()
            addChild(gameWorld!)
            return "World created"
        }
    }

    override func mouseDragged(with event: NSEvent) {
        let newPos = CGPoint(x: (gameWorld?.position.x)!+event.deltaX, y: (gameWorld?.position.y)!-event.deltaY)
        let range = (gameWorld?.size.width)!/2;
        if newPos.x < range && newPos.x > -range && newPos.y < range && newPos.y > -range {
            gameWorld?.position = newPos
        }
    }

    override func mouseMoved(with event: NSEvent) {
        let pos = event.location(in: gameWorld!)
        let nodes = gameWorld?.nodes(at: pos)
        for element in nodes! {
            let node = element as! SKSpriteNode
            if node.name == "WorldCell" {
                if node != lastHoveredCell {
                    lastHoveredCell = node
                }
            } else {
                lastHoveredCell = nil
            }
        }
    }

    override func mouseDown(with event: NSEvent) {
        //
    }
    
    override func didMove(to view: SKView) {
        let pinchGesture = NSMagnificationGestureRecognizer(target: self, action: #selector(handlePinch(gesture:)))
        view.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func handlePinch(gesture : NSMagnificationGestureRecognizer ) {
        var scale = gameWorld?.xScale
        let num = (round(gesture.magnification*10))/1500
        scale! += num
        if scale! > 0.3 && scale! < 2.6 {
            gameWorld?.setScale(scale!)
        }
    }
    
}
