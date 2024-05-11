/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author hp
 */
import com.tech.blog.entities.User;
import java.sql.*;
public class User_Dao {
    private Connection con;

    public User_Dao(Connection con) {
        this.con = con;
    }
    
    //method to insert data to database
    
    public boolean saveUser(User user) {
            boolean f = false;
        try {
            //user-> database
            String q = "insert into user(name, email, password, about) values (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAbout());
            
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    // get user by user email and password
    
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        
        try {
            
            String query = "select * from user where email = ? and password = ?";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set= pstmt.executeQuery();
            
            if (set.next()) {
                user = new User();
                
                //data from db
                String names = set.getString("name");
                String emails = set.getString("email");
                String passwords = set.getString("password");
                String abouts = set.getString("about");
                String profiles = set.getString("profile");
                
                //setting it into user
                user.setId(set.getInt("id"));
                user.setName(names);
                user.setEmail(emails);
                user.setPassword(passwords);
                user.setAbout(abouts);
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(profiles);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    //update the user details
    
    public boolean updateUser(User user) {
        boolean f = false;
        try {
                
                String q = "update user set name = ?, email = ?, password = ?, about = ?, profile = ? where id = ?";
                
                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getEmail());
                pstmt.setString(3, user.getPassword());
                pstmt.setString(4, user.getAbout());
                pstmt.setString(5, user.getProfile());
                pstmt.setInt(6, user.getId());
                pstmt.executeUpdate();
                f = true;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        return f;
    }
    
    public User getUserByUserId(int userid) {
        User user = null;
        try {
            String q = "select * from user where id = ?";

            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, userid);
            
            ResultSet set = pstmt.executeQuery();
            
            if (set.next()) {
                user = new User();
                
                //data from db
                String names = set.getString("name");
                String emails = set.getString("email");
                String passwords = set.getString("password");
                String abouts = set.getString("about");
                String profiles = set.getString("profile");
                
                //setting it into user
                user.setId(set.getInt("id"));
                user.setName(names);
                user.setEmail(emails);
                user.setPassword(passwords);
                user.setAbout(abouts);
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(profiles);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
}
