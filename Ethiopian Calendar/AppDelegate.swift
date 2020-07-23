//
//  AppDelegate.swift
//  Ethiopian Calendar
//
//  Created by Biruk Dubale on 7/22/20.
//  Copyright © 2020 Biruk Dubale. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = NSMenu()
    let popover = NSPopover();
    
    func applicationDidResignActive(_ notification: Notification) {
        print("resigned")
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "🇪🇹"
        statusItem.button?.target = self;
        
        if let button = statusItem.button {
            button.action = #selector(self.statusBarButtonClicked(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        //statusItem.button?.action = #selector(showCalendar)
        constructMenu()
    
    }
    func applicationWillResignActive(_ notification: Notification) {
        print("will resign")
        popover.close()
    }
    
    func applicationWillUnhide(_ notification: Notification) {
        print("unhide")
    }
    
    func applicationDidHide(_ notification: Notification) {
        print("hide")
    }
    
    @objc func statusBarButtonClicked(sender: NSStatusBarButton) {
        let event = NSApp.currentEvent!

        if event.type == NSEvent.EventType.rightMouseUp {
            
            statusItem.popUpMenu(menu)
        } else {
            showCalendar()
        }
    }
    
    func constructMenu() {
      menu.addItem(NSMenuItem(title: "Built by @callbiruk", action: nil, keyEquivalent: ""))
      menu.addItem(NSMenuItem.separator())
      menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showCalendar() {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil);
        
        guard let vc = storyboard.instantiateController(withIdentifier: "viewController") as? ViewController else {
            fatalError("Error in status bar")
        }
        
        guard let button = statusItem.button else {
            fatalError("Error in button")
        }
        
        
        popover.contentViewController = vc
        popover.behavior = .transient
        let nsRec = NSRect(x: 0, y: 0, width: button.bounds.width, height: button.bounds.height)
        popover.show(relativeTo: nsRec, of: button, preferredEdge: .maxY)
        popover.contentViewController?.view.window?.becomeKey()
        
    }
}

