package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.ProductDao;
import com.bookstore.entity.Product;
import com.bookstore.utils.DBUtils;

public class ProductDaoImpl implements ProductDao {
	
	private CategoryDao categoryDao = new CategoryDaoImpl();

	@Override
	public void insert(Product product) {
		String sql = "INSERT INTO bookstore_product(id,name,writer,price,category_id,store_num,img_url,description) VALUES(?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, product.getId());
			pst.setString(2, product.getName());
			pst.setString(3, product.getWriter());
			pst.setDouble(4, product.getPrice());
			pst.setString(5, product.getCategory().getId());
			pst.setInt(6, product.getStoreNum());
			pst.setString(7, product.getImgUrl());
			pst.setString(8, product.getDescription());
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void update(Product product) {
		String sql = "UPDATE bookstore_product SET name=?,writer=?,price=?,category_id=?,store_num=?,img_url=?,description=? WHERE id=?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, product.getName());
			pst.setString(2, product.getWriter());
			pst.setDouble(3, product.getPrice());
			pst.setString(4, product.getCategory().getId());
			pst.setInt(5, product.getStoreNum());
			pst.setString(6, product.getImgUrl());
			pst.setString(7, product.getDescription());
			pst.setString(8, product.getId());
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public void delete(String id) {
		String sql = "DELETE FROM bookstore_product WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst);
		}
	}

	@Override
	public Product findById(String id) {
		Product product = null;
		String sql = "SELECT * FROM bookstore_product WHERE id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setWriter(rs.getString("writer"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(categoryDao.findById(rs.getString("category_id")));
				product.setStoreNum(rs.getInt("store_num"));
				product.setImgUrl(rs.getString("img_url"));
				product.setDescription(rs.getString("description"));
				product.setCreateDate(rs.getTimestamp("create_date"));
				product.setUpdateDate(rs.getTimestamp("update_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return product;
	}

	@Override
	public List<Product> findByCategory(String categoryId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_product WHERE category_id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, categoryId);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setWriter(rs.getString("writer"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(categoryDao.findById(rs.getString("category_id")));
				product.setStoreNum(rs.getInt("store_num"));
				product.setImgUrl(rs.getString("img_url"));
				product.setDescription(rs.getString("description"));
				product.setCreateDate(rs.getTimestamp("create_date"));
				product.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return list;
	}

	@Override
	public List<Product> findByName(String name) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_product WHERE name LIKE ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, "%"+name+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setWriter(rs.getString("writer"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(categoryDao.findById(rs.getString("category_id")));
				product.setStoreNum(rs.getInt("store_num"));
				product.setImgUrl(rs.getString("img_url"));
				product.setDescription(rs.getString("description"));
				product.setCreateDate(rs.getTimestamp("create_date"));
				product.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return list;
	}

	@Override
	public List<Product> findAll() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_product";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setWriter(rs.getString("writer"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(categoryDao.findById(rs.getString("category_id")));
				product.setStoreNum(rs.getInt("store_num"));
				product.setImgUrl(rs.getString("img_url"));
				product.setDescription(rs.getString("description"));
				product.setCreateDate(rs.getTimestamp("create_date"));
				product.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.free(con, pst, rs);
		}
		return list;
	}

}
