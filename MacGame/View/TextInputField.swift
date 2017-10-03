//
//  TextInputField.swift
//  MacGame
//
//  Created by Rami Khatib on 01.10.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa

class TextInputField: NSTextField {
    var isFirstResponder = false

    override init(frame frameRect: NSRect) {
        let rect = NSRect(origin: CGPoint(x: 0, y: 30), size: CGSize(width: frameRect.width, height: 20))
        super.init(frame: rect)
        isEnabled = true
        isEditable = true
        isSelectable = true
    }
    
    func setFocus() {
        if !isFirstResponder {
            isFirstResponder = true
            becomeFirstResponder()
        }
    }
    
    override func textDidEndEditing(_ notification: Notification) {
        resignFirstResponder()
        isFirstResponder = false
        stringValue = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
