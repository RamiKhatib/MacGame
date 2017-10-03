//
//  WorldGridCell.swift
//  MacGame
//
//  Created by Rami Khatib on 02.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa
import SpriteKit

class WorldGridCell: SKSpriteNode {
    convenience init(){
        self.init(color: .darkGray , size: CGSize(width: 50, height: 50))
        zPosition = 0
    }
}
