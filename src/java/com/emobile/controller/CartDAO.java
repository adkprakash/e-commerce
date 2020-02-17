/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emobile.controller;

import com.emobile.model.Cart;
import com.emobile.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CartDAO {

    public int addCart(Cart ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_cart (customer_id, session_id, product_id, quantity, price, color, ram, rom) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getCustomer_id());
            st.setString(2, ob.getSession_id());
            st.setInt(3, ob.getProduct_id());
            st.setInt(4, ob.getQuantity());
            st.setDouble(5, ob.getPrice());
            st.setString(6, ob.getColor());
            st.setString(7, ob.getRam());
            st.setString(8, ob.getRom());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static List<Cart> cartByCustomer(int cid) {
        List<Cart> cList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_cart as c inner join product as p on c.product_id = p.id where customer_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart ob = new Cart();
                ob.setProduct_name(rs.getString("name"));
                ob.setProduct_id(rs.getInt("product_id"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                cList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cList;
    }

    public static int getQty(Cart ob) {
        int qty = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_cart where customer_id = ? and product_id = ? and color = ? and ram = ? and rom = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getCustomer_id());
            st.setInt(2, ob.getProduct_id());
            st.setString(3, ob.getColor());
            st.setString(4, ob.getRam());
            st.setString(5, ob.getRom());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                qty = rs.getInt("quantity");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return qty;
    }
    
    public static int getQtyById(int pid) {
        int qty = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_cart where product_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                qty = rs.getInt("quantity");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return qty;
    }

    public static int updateCart(Cart ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update tbl_cart set quantity = ? where customer_id = ? and product_id = ? and color = ? and ram = ? and rom = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getQuantity());
            st.setInt(2, ob.getCustomer_id());
            st.setInt(3, ob.getProduct_id());
            st.setString(4, ob.getColor());
            st.setString(5, ob.getRam());
            st.setString(6, ob.getRom());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int countCustomerCart(int cid) {
        int quantity = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select quantity from tbl_cart where customer_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                quantity += rs.getInt("quantity");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return quantity;
    }

    public static int removeCart(int pid, int cid, String color, String ram, String rom) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "delete from tbl_cart where product_id = ? and customer_id = ? and color = ? and ram = ? and rom = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, cid);
            st.setString(3, color);
            st.setString(4, ram);
            st.setString(5, rom);
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int removeCartDetail(int cid) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "delete from tbl_cart where customer_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
}
