package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.bookstore.dao.OrderDao;
import com.bookstore.dao.UserDao;
import com.bookstore.entity.Order;
import com.bookstore.entity.User;
import com.bookstore.utils.DBUtils;

public class OrderDaoImpl implements OrderDao{
	
	private UserDao userDao = new UserDaoImpl();

	@Override
	public void insert(Order order) {
		String sql = "INSERT INTO bookstore_order(id,money,receive_address,receive_name,receive_phone,pay_status,user_id) VALUES(?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, order.getId());
			pst.setDouble(2, order.getMoney());
			pst.setString(3, order.getReceiveAddress());
			pst.setString(4, order.getReceiveName());
			pst.setString(5, order.getReceivePhone());
			pst.setInt(6, order.getPayStatus());
			pst.setString(7, order.getUser().getId());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void update(Order order) {
		String sql = "UPDATE bookstore_order SET money=?,receive_address=?,receive_name=?,receive_phone=?,pay_status=? WHERE id=?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setDouble(1, order.getMoney());
			pst.setString(2, order.getReceiveAddress());
			pst.setString(3, order.getReceiveName());
			pst.setString(4, order.getReceivePhone());
			pst.setInt(5, order.getPayStatus());
			pst.setString(6, order.getId());
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
		String sql = "DELETE FROM bookstore_order WHERE id=?";
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
	public Order findById(String id) {
		Order order = null;
		String sql = "SELECT * FROM bookstore_order WHERE id=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				order = new Order();
				order.setId(rs.getString("id"));
				order.setMoney(rs.getDouble("money"));
				order.setReceiveAddress(rs.getString("receive_address"));
				order.setReceiveName(rs.getString("receive_name"));
				order.setReceivePhone(rs.getString("receive_phone"));
				order.setPayStatus(rs.getInt("pay_status"));
				order.setUser(userDao.getById(rs.getString("user_id")));
				order.setCreateDate(rs.getTimestamp("create_date"));
				order.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return order;
	}

	@Override
	public List<Order> findListByUser(User user) {
		List<Order> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_order WHERE user_id=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getId());
			rs = pst.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setId(rs.getString("id"));
				order.setMoney(rs.getDouble("money"));
				order.setReceiveAddress(rs.getString("receive_address"));
				order.setReceiveName(rs.getString("receive_name"));
				order.setReceivePhone(rs.getString("receive_phone"));
				order.setPayStatus(rs.getInt("pay_status"));
				order.setUser(userDao.getById(rs.getString("user_id")));
				order.setCreateDate(rs.getTimestamp("create_date"));
				order.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return list;
	}
}
