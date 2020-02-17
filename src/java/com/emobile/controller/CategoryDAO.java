/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emobile.controller;

import com.emobile.model.Category;
import com.emobile.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CategoryDAO {

    public int addCategory(Category ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into category (category_name) values (?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getCategory());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    public List<Category> retrieveCategory(){
        List<Category> cList = new ArrayList();
        try{
            Connection con = DBConnection.getConnection();
            String sql = "select * from category";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Category ob = new Category();
                ob.setId(rs.getInt("id"));
                ob.setCategory(rs.getString("category_name"));
                cList.add(ob);
            }
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return cList;
    }
    public List<Category> retrieveCategoryBySearch(String search){
        List<Category> cList = new ArrayList();
        try{
            Connection con = DBConnection.getConnection();
            String sql = "select * from category where category_name like ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, search + "%");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Category ob = new Category();
                ob.setId(rs.getInt("id"));
                ob.setCategory(rs.getString("category_name"));
                cList.add(ob);
            }
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return cList;
    }
    public static Category viewById(int id){
        Category ob = new Category();
        try{
            Connection con = DBConnection.getConnection();
            String sql = "select * from category where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                ob.setId(rs.getInt(1));
                ob.setCategory(rs.getString(2));
            }
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return ob;
    }
    public int updateCategory(Category ob){
        int count = 0;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "update category set category_name = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getCategory());
            st.setInt(2, ob.getId());
            count = st.executeUpdate();
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return count;
    }
    public static int deleteCategory(int id){
        int count = 0;
        try{
            Connection con = DBConnection.getConnection();
            String sql = "delete from category where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);;
            count = st.executeUpdate();
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return count;
    }
}
