package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.bookstore.dao.CartItemDao;
import com.bookstore.dao.ProductDao;
import com.bookstore.dao.UserDao;
import com.bookstore.entity.CartItem;
import com.bookstore.entity.User;
import com.bookstore.utils.DBUtils;

public class CartItemDaoImpl implements CartItemDao {

	private UserDao userDao = new UserDaoImpl();
	
	private ProductDao productDao = new ProductDaoImpl();
	
	@Override
	public void insert(CartItem cartItem) {
		String sql = "INSERT INTO bookstore_cart(id,product_id,user_id,available,num) VALUES(?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, cartItem.getId());
			pst.setString(2, cartItem.getProduct().getId());
			pst.setString(3, cartItem.getUser().getId());
			pst.setInt(4, 1);
			pst.setInt(5, cartItem.getNum());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void update(CartItem cartItem) {
		String sql = "UPDATE bookstore_cart SET available=?,num=? WHERE id=?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, cartItem.getAvailable());
			pst.setInt(2, cartItem.getNum());
			pst.setString(3, cartItem.getId());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void delete(String id) {
		String sql = "DELETE FROM bookstore_cart WHERE id=?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public List<CartItem> findListByUser(User user) {
		List<CartItem> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_cart WHERE user_id = ? AND available = 1";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getId());
			rs = pst.executeQuery();
			while(rs.next()) {
				CartItem cartItem = new CartItem();
				cartItem.setId(rs.getString("id"));
				cartItem.setProduct(productDao.findById(rs.getString("product_id")));
				cartItem.setUser(userDao.getById(rs.getString("user_id")));
				cartItem.setAvailable(rs.getInt("available"));
				cartItem.setNum(rs.getInt("num"));
				cartItem.setCreateDate(rs.getTimestamp("create_date"));
				cartItem.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(cartItem);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst,rs);
		}
		return list;
	}
	
	@Override
	public CartItem findById(String id,String productId) {
		CartItem cartItem = null;
		String sql = "SELECT * FROM bookstore_cart WHERE user_id= ? AND product_id = ? AND available = 1";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, productId);
			rs = pst.executeQuery();
			while(rs.next()) {
				cartItem = new CartItem();
				cartItem.setId(rs.getString("id"));
				cartItem.setProduct(productDao.findById(rs.getString("product_id")));
				cartItem.setUser(userDao.getById(rs.getString("user_id")));
				cartItem.setAvailable(rs.getInt("available"));
				cartItem.setNum(rs.getInt("num"));
				cartItem.setCreateDate(rs.getTimestamp("create_date"));
				cartItem.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst,rs);
		}
		return cartItem;
	}
	
	@Override
	public CartItem findById(String id) {
		CartItem cartItem = null;
		String sql = "SELECT * FROM bookstore_cart WHERE id= ? AND available = 1";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				cartItem = new CartItem();
				cartItem.setId(rs.getString("id"));
				cartItem.setProduct(productDao.findById(rs.getString("product_id")));
				cartItem.setUser(userDao.getById(rs.getString("user_id")));
				cartItem.setAvailable(rs.getInt("available"));
				cartItem.setNum(rs.getInt("num"));
				cartItem.setCreateDate(rs.getTimestamp("create_date"));
				cartItem.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst,rs);
		}
		return cartItem;
	}
}
