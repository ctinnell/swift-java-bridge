//
//  ViewController.swift
//  JavaExample
//
//  Created by Clay Tinnell on 2/26/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa
import JavaVM

class ViewController: NSViewController {
    
    @IBOutlet weak var sqlTextView: NSScrollView!

    let javaWrapper = JavaWrapper()

    override func viewDidLoad() {
        super.viewDidLoad()
        javaWrapper.initialize()
        
        println("bridge created")
        // Do any additional setup after loading the view.
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func executeQuery(sender: AnyObject) {
        let text = sqlTextView.contentView.documentView?.string
        javaWrapper.executeQuery(text)
    }

}

