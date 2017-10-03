//
//  GameWorld.swift
//  MacGame
//
//  Created by Rami Khatib on 02.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa
import SpriteKit

class GameWorld: SKSpriteNode {

    var objectListDictionary = [String:[Any]]()
    
    convenience init(){
        self.init(texture: nil, color: .blue, size: CGSize(width: 2050, height: 2050))
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        name = "World"
        
        initObjectLists()
        fillWorldWithCells()
    }
    
    private func initObjectLists(){
        objectListDictionary["WorldGridCells"] = [WorldGridCell]()
    }
    
    private func fillWorldWithCells(){
        let cellRange = Int(size.width/50)
        var newPos = CGPoint(x: -(size.width/2)+25, y: -(size.height/2)+25)
        var list = objectListDictionary["WorldGridCell"]
        for _ in 0...cellRange-1 {
            for _ in 0...cellRange-1 {
                let node = WorldGridCell()
                node.name = "WorldCell"
                node.position = newPos
                addChild(node)
                list?.append(node)
                newPos.y += 50.0
            }
            newPos.x += 50.0
            newPos.y = -(size.height/2)+25
        }
    }

}
