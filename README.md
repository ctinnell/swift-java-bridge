# swift-java-bridge
Execute Java Code from a Swift Cocoa Application 

## Overview 
This project demonstrates using a Cocoa Application to execute queries against a remote database.  This sample Cocoa application will launch a JVM, import DB2 JDBC drivers into the classpath, and communicate through JNI using C to a Java class that connects to a DB2 database and executes queries.  The Cocoa application is written in Swift, but accesses Objective-C methods to connect and execute the queries.

## Disclaimer
Any project that mixes Cocoa, C, Java, JNI, JDBC, Objectice-C, and Swift has to be fun, right?  This program isn't really meant to be used for anything yet other than to demonstrate how these technologies can be used together to do powerful things.  My frustration with the lack of database connectivity in Cocoa may drive me to package this up in a nice framework some day.
