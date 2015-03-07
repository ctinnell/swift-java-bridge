//
//  DatabaseConnection.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/7/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa

class DatabaseConnection {

    let databaseDriver: DatabaseDriver
    var userName: String?
    
    init(databaseDriver: DatabaseDriver) {
        self.databaseDriver = databaseDriver
    }
}
