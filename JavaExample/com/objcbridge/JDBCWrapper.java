package com.objcbridge;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 * Created by ctinnell on 3/3/15.
 */
public class JDBCWrapper {
    public Connection connection = null;
    public ResultSet rs = null;

    public void connect(String url, String className, String userName, String password) throws SQLException {
        try {
            /* Load class into memory */
            Class.forName(className);
            //Establish connection
            System.out.println("class name = " + className);
            System.out.println("url = " + url);
            connection = DriverManager.getConnection(url, userName, password);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(connection!=null){
                System.out.println("Connected successfully.");
            }
        }
    }

    public void disconnect() throws SQLException {
        try {
            connection.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw sqle;
        }
    }

    public void executeQuery(String query) throws  SQLException {
        try {
            java.sql.Statement stmt = connection.createStatement();
            rs = stmt.executeQuery(query);
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw sqle;
        }
    }

    public static void main(String[] args) {
        String className="com.ibm.db2.jcc.DB2Driver";
        String url="jdbc:db2://devdb.site.com:50000/gicrop02";
        String user=" ";
        String password=" ";

        JDBCWrapper wrapper = new JDBCWrapper();
        try {
            wrapper.connect(url, className, user, password);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }


}
