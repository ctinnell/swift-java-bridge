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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension AddConnectionViewController: NSTextFieldDelegate {
    
    
}
