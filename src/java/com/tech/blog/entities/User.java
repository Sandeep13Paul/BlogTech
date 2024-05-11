/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
    //variables
    private int id;
    private String name;
    private String email;
    private String password;
    private String about;
    private Timestamp dateTime;
    private String profile;
    
    //constructor

    public User(int id, String name, String email, String password, String about, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.profile = profile;
    }

    public User() {
    }

    public User(String name, String email, String password, String about, String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.profile = profile;
    }
    
    //getters and setters

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAbout() {
        return about;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    
}
