/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author hp
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class Post_Dao {
    Connection con;

    public Post_Dao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getCategories() {
        ArrayList<Category> list = new ArrayList<>();
        
        try {
            
            String q = "select * from categories";
            
            Statement stmt = con.prepareStatement(q);
            ResultSet set = stmt.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p) {
        boolean flag = false;
        
        try {
            
            String q = "insert into posts(pTitle, pContent, pCode, pPic, cid, userId) values(?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCid());
            pstmt.setInt(6, p.getUid());
            
            pstmt.executeUpdate();
            
            flag = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        //fetch all posts
        try {
            
            String q = "select * from posts order by pid desc";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            
            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("cid");
                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catid) {
        List<Post> list = new ArrayList<>();
        //fetch post by catid
        try {
            
            String q = "select * from posts where cid = ?";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, catid);
            
            ResultSet set = pstmt.executeQuery();
            
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
//                int catId = set.getInt("cid");
                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catid, userId);
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postid) {
        Post post = null;
        
        String q = "select * from posts where pid=?";
        
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postid);
            ResultSet set = p.executeQuery();
            
            if (set.next()) {
                
                int cid = set.getInt("cid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
//                int catId = set.getInt("cid");
                int userId = set.getInt("userId");
                post = new Post(postid, pTitle, pContent, pCode, pPic, date, cid, userId);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return post;
    }
}
