/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emobile.controller;

import com.emobile.model.Order;
import com.emobile.model.OrderDetail;
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
public class OrderDAO {

    public static int saveOrder(Order ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_order (customer_id, customer_name, shipping_address, email, phone, order_date) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getCustomer_id());
            st.setString(2, ob.getName());
            st.setString(3, ob.getAddress());
            st.setString(4, ob.getEmail());
            st.setString(5, ob.getPhone());
            st.setDate(6, new java.sql.Date(ob.getDate().getTime()));
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int saveOrderDetail(OrderDetail ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into tbl_order_details (order_id, product_id, quantity, price, color, ram, rom) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getOrder_id());
            st.setInt(2, ob.getProduct_id());
            st.setInt(3, ob.getQuantity());
            st.setDouble(4, ob.getPrice());
            st.setString(5, ob.getColor());
            st.setString(6, ob.getRam());
            st.setString(7, ob.getRom());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    public static List<Order> viewOrder() {
        List<Order> oList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_order";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Order ob = new Order();
                ob.setId(rs.getInt("id"));
                ob.setName(rs.getString("customer_name"));
                ob.setEmail(rs.getString("email"));
                ob.setAddress(rs.getString("shipping_address"));
                ob.setPhone(rs.getString("phone"));
                ob.setDate(rs.getDate("order_date"));
                oList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return oList;
    }
    public static List<OrderDetail> viewOrderDetail(int oid) {
        List<OrderDetail> oList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from tbl_order_details as od inner join product as p on od.product_id = p.id where order_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail ob = new OrderDetail();
                ob.setId(rs.getInt("id"));
                ob.setProduct_name(rs.getString("name"));
                ob.setProduct_id(rs.getInt("product_id"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                oList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return oList;
    }
}
