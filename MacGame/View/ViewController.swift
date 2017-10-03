//
//  ViewController.swift
//  MacGame
//
//  Created by Rami Khatib on 01.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {

    @IBOutlet var skView: GameView!
    var textInputField : TextInputField?
    
    func handle(evt: NSEvent) {
        if evt.modifierFlags.rawValue == 262401 {
            textInputField?.setFocus()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: NSEvent.EventTypeMask.flagsChanged, handler: {(evt: NSEvent!)  in self.handle(evt: evt); return nil})
    }
    
    override func viewDidAppear() {
        skView.window?.makeFirstResponder(self)
        skView.frame = (skView.window?.frame)!
        skView.window?.acceptsMouseMovedEvents = true
        createTextFields()
    }
    
    private func createTextFields(){
        textInputField = TextInputField(frame: skView.frame)
        skView.addSubview(textInputField!)
    }
    
}
