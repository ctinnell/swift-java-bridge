//
//  DatabaseDriver.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/7/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa


class DatabaseDriver {
    enum DatabaseType {
        case DB2
    }
    
    let databaseType: DatabaseType
    let className: String
    let urlPrefix: String
    let defaultPort: String
    
    init(databaseType: DatabaseType, className: String, urlPrefix: String, defaultPort: String) {
        self.databaseType = databaseType
        self.className = className
        self.urlPrefix = urlPrefix
        self.defaultPort = defaultPort
    }
    
    func urlString(hostName: String, port: String, databaseName: String) -> String {
        return urlPrefix + hostName + ":" + port + "/" + databaseName;
    }
}

