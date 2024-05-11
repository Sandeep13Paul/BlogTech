/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

/**
 *
 * @author hp
 */
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    
//    get connection
    public static Connection getConnection() {
        try {
            
            // if there are no connection
            if (con == null) {
                // driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                //add url, username, password to variables
            
                String url = "jdbc:mysql://localhost:3306/techblog";
                String username = "user1";
                String password = "S@2001Pl";
            
                // create connection
                con = DriverManager.getConnection(url, username, password);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
