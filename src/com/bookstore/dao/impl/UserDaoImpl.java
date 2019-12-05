package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import com.bookstore.dao.UserDao;
import com.bookstore.entity.User;
import com.bookstore.utils.DBUtils;

public class UserDaoImpl implements UserDao {

	@Override
	public User getById(String id) {
		User user = null;
		String sql = "SELECT * FROM bookstore_user WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setImgUrl(rs.getString("img_url"));
				user.setCreateDate(rs.getTimestamp("create_date"));
				user.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return user;
	}

	@Override
	public User getByPhone(String phone) {
		User user = null;
		String sql = "SELECT * FROM bookstore_user WHERE phone = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, phone);
			rs = pst.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setImgUrl(rs.getString("img_url"));
				user.setCreateDate(rs.getTimestamp("create_date"));
				user.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return user;
	}

	@Override
	public void addUser(User user) {
		String sql = "INSERT INTO bookstore_user(id,username,password,email,phone,img_url,role) VALUES(?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getId());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getPhone());
			pst.setString(6, user.getImgUrl());
			pst.setString(7, "normal");
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void updateUser(User user) {
		String sql = "UPDATE bookstore_user SET username = ?,password = ?,email = ?,phone = ?,img_url=? WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPhone());
			pst.setString(5, user.getImgUrl());
			pst.setString(6, user.getId());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

}
