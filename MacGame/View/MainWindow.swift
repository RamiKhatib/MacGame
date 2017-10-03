
//
//  MainWindow.swift
//  OSX DEV TUT
//
//  Created by Rami Khatib on 25.09.17.
//  Copyright © 2017 Rami Khatib. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        // Hide menubar
        NSMenu.setMenuBarVisible(false)
        let rect = NSRect(x: 0, y: 0, width: (NSScreen.main?.frame)!.width, height: (NSScreen.main?.frame)!.height)
        super.init(contentRect: rect , styleMask: [.fullScreen] , backing: backingStoreType, defer: flag)
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
    }
    
    override var canBecomeKey: Bool {
        return true
    }
}
