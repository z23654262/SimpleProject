package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.bookstore.dao.CategoryDao;
import com.bookstore.entity.Category;
import com.bookstore.utils.DBUtils;

public class CategoryDaoImpl implements CategoryDao {

	@Override
	public void insert(Category category) {
		String sql = "INSERT INTO bookstore_category(id,name) VALUES(?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, category.getId());
			pst.setString(2, category.getCategoryName());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void update(Category category) {
		String sql = "UPDATE bookstore_category SET name = ? WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, category.getCategoryName());
			pst.setString(2, category.getId());
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
		String sql = "DELETE FROM bookstore_category WHERE id = ?";
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
	public Category findById(String id) {
		Category category = null;
		String sql = "SELECT * FROM bookstore_category WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				category = new Category();
				category.setId(rs.getString("id"));
				category.setCategoryName(rs.getString("name"));
				category.setCreateDate(rs.getTimestamp("create_date"));
				category.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst,rs);
		}
		return category;
	}

	@Override
	public List<Category> findAll() {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_category";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getString("id"));
				category.setCategoryName(rs.getString("name"));
				category.setCreateDate(rs.getTimestamp("create_date"));
				category.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst,rs);
		}
		return list;
	}

}
