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
    let jdbcWrapper: JavaWrapper
    let hostName: String
    let port: String
    let databaseName: String
    
    // gets set at connection time. don't save pwd.
    var userName: String?

    init(databaseDriver: DatabaseDriver, hostName: String, port: String, databaseName: String) {
        self.databaseDriver = databaseDriver
        self.jdbcWrapper = JavaWrapper()
        self.hostName = hostName
        self.port = port
        self.databaseName = databaseName
    }
    
    func urlString() -> String {
        return databaseDriver.urlString(hostName, port: port, databaseName: databaseName)
    }
    
    func connect(userName: String, password: String) {
        self.userName = userName
        jdbcWrapper.connect(databaseDriver.className, url: urlString(), userid: userName, password: password)
    }
}
