# swift-java-bridge
Execute Java Code from a Swift Cocoa Application 

##
This project demonstrates using a Cocoa Application to execute queries against a remote database.  This sample Cocoa application will launch a JVM, import DB2 JDBC drivers into the classpath, and communicate through JNI using C to a Java class that connects to a DB2 database and executes queries.  The Cocoa application is written in Swift, but accesses Objective-C methods to connect and execute the queries.

###
Any project that mixes Cocoa, C, Java, JNI, JDBC, Objectice-C, and Swift has to be fun, right?
