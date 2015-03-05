//
//  AddConnectionViewController.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/3/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa

class AddConnectionViewController: NSViewController {

    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var urlTextField: NSTextField!
    @IBOutlet weak var userNameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    var wrapper: JavaWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.stringValue = "Test Database"
        urlTextField.stringValue = "jdbc:db2://devdb.site.com:50000/gicrop02"
        userNameTextField.stringValue = "testUser"
        passwordTextField.stringValue = "pwd"
    
        // Do view setup here.
    }
    
    @IBAction func connectToDatabase(sender: AnyObject) {
        wrapper = JavaWrapper()
        //wrapper?.initialize()
        if let w = wrapper {
//            dispatch_async(dispatch_get_main_queue(), {
                w.connect(nameTextField.stringValue, url: urlTextField.stringValue, userid:userNameTextField.stringValue, password:passwordTextField.stringValue)
//            })
            
        }
    }
}


