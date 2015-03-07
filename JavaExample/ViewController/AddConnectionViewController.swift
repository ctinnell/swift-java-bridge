//
//  AddConnectionViewController.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/3/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa

class AddConnectionViewController: NSViewController {

 
    @IBOutlet weak var userNameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    var wrapper: JavaWrapper?
    var dbConnection: DatabaseConnection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.stringValue = "testUser"
        passwordTextField.stringValue = "pwd"    
    }
    
    @IBAction func connectToDatabase(sender: AnyObject) {
        dbConnection = DatabaseConnection(databaseDriver: DB2DatabaseDriver(), hostName: "devdb.greatag.com", port: "50000", databaseName: "gicrop02")
        dbConnection?.connect(userNameTextField.stringValue, password: passwordTextField.stringValue)
    }
}


