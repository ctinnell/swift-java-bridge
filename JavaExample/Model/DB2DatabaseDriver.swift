//
//  DB2DatabaseDriver.swift
//  JavaExample
//
//  Created by Clay Tinnell on 3/7/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Cocoa

class DB2DatabaseDriver: DatabaseDriver {
    init() {
        super.init(databaseType: .DB2, className: "com.ibm.db2.jcc.DB2Driver", urlPrefix: "jdbc:db2://", defaultPort: "50000")
    }
}
