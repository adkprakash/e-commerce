/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emobile.controller;

import com.emobile.model.Admin;
import com.emobile.model.Login;
import com.emobile.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Dell
 */
public class LoginDAO {

    public static int insertUser(Login ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_customer (name, username, email, password, phone, address) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getName());
            st.setString(2, ob.getUsername());
            st.setString(3, ob.getEmail());
            st.setString(4, ob.getPassword());
            st.setString(5, ob.getPhone());
            st.setString(6, ob.getAddress());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int verifyUser(Login ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select id, username, password from tbl_customer where username = ? and password = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getUsername());
            st.setString(2, ob.getPassword());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = 1;
                ob.setId(rs.getInt("id"));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int insertAdmin(Admin ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_admin (username, email, password) values (?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getUsername());
            st.setString(2, ob.getEmail());
            st.setString(3, ob.getPassword());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int verifyAdmin(Admin ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select id, username, password from tbl_admin where username = ? and password = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getUsername());
            st.setString(2, ob.getPassword());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = 1;
                ob.setId(rs.getInt("id"));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int verifyPwd(int id, String pwd) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select password from tbl_admin where id = ? and password = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, pwd);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = 1;
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int changePwd(int id, String pwd) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update tbl_admin set password = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, pwd);
            st.setInt(2, id);
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int forgotPwd(Admin ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update tbl_admin set password = ? where email = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getPassword());
            st.setString(2, ob.getEmail());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static Login getOldPwd(int uid) {
        Login ob = new Login();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select password from tbl_admin where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ob.setPassword(rs.getString("password"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ob;
    }
}
