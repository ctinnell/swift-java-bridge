//
//  AddConnectionViewController.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/3/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa

class AddConnectionViewController: NSViewController {

 
    @IBOutlet weak var hostNameTextField: NSTextField!
    @IBOutlet weak var portTextField: NSTextField!
    @IBOutlet weak var databaseNameTextField: NSTextField!
    @IBOutlet weak var userNameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    var wrapper: JavaWrapper?
    var dbConnection: DatabaseConnection?
    var driver = DB2DatabaseDriver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.portTextField.stringValue = driver.defaultPort
    }
    
    @IBAction func connectToDatabase(sender: AnyObject) {
        dbConnection = DatabaseConnection(databaseDriver: driver, hostName: hostNameTextField.stringValue, port: portTextField.stringValue, databaseName: databaseNameTextField.stringValue)
        
        dbConnection?.connect(userNameTextField.stringValue, password: passwordTextField.stringValue)
    }
}


