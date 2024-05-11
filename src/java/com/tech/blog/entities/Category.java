/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author hp
 */
public class Category {
    private int cid;
    private String name;
    private String Description;

    public Category(int cid, String name, String Description) {
        this.cid = cid;
        this.name = name;
        this.Description = Description;
    }

    public Category() {
    }

    public Category(String name, String Description) {
        this.name = name;
        this.Description = Description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
    
}
