/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emobile.controller;

import com.emobile.model.Product;
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
public class ProductDAO {

    public int addProduct(Product ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "insert into product (cid, name, quantity, price, color, ram, rom, description, image) values "
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getCid());
            st.setString(2, ob.getName());
            st.setInt(3, ob.getQuantity());
            st.setDouble(4, ob.getPrice());
            st.setString(5, ob.getColor());
            st.setString(6, ob.getRam());
            st.setString(7, ob.getRom());
            st.setString(8, ob.getDescription());
            st.setString(9, ob.getImage());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public List<Product> viewProduct() {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }

    public static Product getQty(int pid) {
        Product ob = new Product();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select quantity from product where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ob.setQuantity(rs.getInt("quantity"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ob;
    }

    public static int addQuantity(Product ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update product set quantity = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, ob.getQuantity());
            st.setInt(2, ob.getId());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static Product viewById(int id) {
        Product ob = new Product();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ob.setId(rs.getInt(1));
                ob.setCid(rs.getInt(2));
                ob.setName(rs.getString(3));
                ob.setQuantity(rs.getInt(4));
                ob.setPrice(rs.getDouble(5));
                ob.setColor(rs.getString(6));
                ob.setRam(rs.getString(7));
                ob.setRom(rs.getString(8));
                ob.setDescription(rs.getString(9));
                ob.setImage(rs.getString(10));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return ob;
    }

    public static List<Product> viewByCategory(int cid) {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where cid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }

    public int updateProduct(Product ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update product set name = ?, quantity = ?, price = ?, color = ?, ram = ?, rom = ?, description = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getName());
            st.setInt(2, ob.getQuantity());
            st.setDouble(3, ob.getPrice());
            st.setString(4, ob.getColor());
            st.setString(5, ob.getRam());
            st.setString(6, ob.getRom());
            st.setString(7, ob.getDescription());
            st.setInt(8, ob.getId());
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int deleteProduct(int id) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "delete from product where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);;
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static int updateImage(Product ob) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update product set image = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, ob.getImage());
            st.setInt(2, ob.getId());;
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }

    public static List<Product> viewLatestProduct() {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product order by id desc limit 8";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }
    public static List<Product> viewLatestProductBySearch(String q) {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where name like ? order by id desc limit 8";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + q + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }
    public List<Product> viewProductBySearch(String q) {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where name like ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, q + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }
        public List<Product> viewProductByCategory(int cid, String q) {
        List<Product> pList = new ArrayList();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where cid = ? and name like ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            st.setString(2, q + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pList;
    }
    public static int updateQuantity(int pid, int qty) {
        int count = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "update product set quantity = ? where id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, qty);
            st.setInt(2, pid);
            count = st.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return count;
    }
    public static List<Product> relatedProduct(int cid){
        List<Product> pList = new ArrayList();
        try{
            Connection con = DBConnection.getConnection();
            String sql = "select * from product where cid = ? order by id desc limit 4";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product ob = new Product();
                ob.setId(rs.getInt("id"));
                ob.setCid(rs.getInt("cid"));
                ob.setName(rs.getString("name"));
                ob.setQuantity(rs.getInt("quantity"));
                ob.setPrice(rs.getDouble("price"));
                ob.setColor(rs.getString("color"));
                ob.setRam(rs.getString("ram"));
                ob.setRom(rs.getString("rom"));
                ob.setDescription(rs.getString("description"));
                ob.setImage(rs.getString("image"));
                pList.add(ob);
            }
            con.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return pList;
    }
}
