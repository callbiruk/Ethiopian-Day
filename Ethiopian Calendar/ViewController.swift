//
//  ViewController.swift
//  Ethiopian Calendar
//
//  Created by Biruk Dubale on 7/22/20.
//  Copyright © 2020 Biruk Dubale. All rights reserved.
//

import Cocoa

import JavaScriptCore

class ViewController: NSViewController {

    
    @IBOutlet var backgroundView: NSView!
    
    @IBOutlet weak var monthLabel: NSTextField!
    @IBOutlet weak var daylabel: NSTextField!
    @IBOutlet weak var weekLabel: NSTextField!
    @IBOutlet weak var yearLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.wantsLayer = true
        setEthiopianCalendar()
        
    }
    override func viewWillAppear() {
        let col = (37/255 * 1.0) as CGFloat
        backgroundView.layer?.backgroundColor = CGColor(red: col, green: col, blue: col, alpha: 1.0)
        //box.layer?.setNeedsDisplay()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded
        }
    }

    func setEthiopianCalendar() {
       
        let date = Date()
        
        let calendar = Calendar(identifier: .ethiopicAmeteMihret)
        let eyear = calendar.component(.year, from: date)
        let emonth = calendar.component(.month, from: date)
        let eday = calendar.component(.day, from: date)
        let eweek = calendar.component(.weekday, from: date)
        
        yearLabel.stringValue = "\(eyear)"
        monthLabel.stringValue = Resources.EthiopianMonths[emonth-1]
        daylabel.stringValue = "\(eday)"
        weekLabel.stringValue = Resources.EthiopianWeekDays[eweek-1]
        
    }
    
    func convertToEthiopianCalendar(date: Date) {
        let url = URL(string: "https://www.swapi.co/api/films")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          // your code here
        })

        task.resume()
    }
}

