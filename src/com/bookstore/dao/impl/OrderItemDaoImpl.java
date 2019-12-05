package com.bookstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.bookstore.dao.OrderDao;
import com.bookstore.dao.OrderItemDao;
import com.bookstore.dao.ProductDao;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderItem;
import com.bookstore.utils.DBUtils;

public class OrderItemDaoImpl implements OrderItemDao {

	private ProductDao productDao = new ProductDaoImpl();
	
	private OrderDao orderDao = new OrderDaoImpl();
	
	@Override
	public void insert(OrderItem orderItem) {
		String sql = "INSERT INTO bookstore_order_item(id,product_id,order_id,buy_num) VALUES(?,?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, orderItem.getId());
			pst.setString(2, orderItem.getProduct().getId());
			pst.setString(3, orderItem.getOrder().getId());
			pst.setInt(4, orderItem.getBuyNum());
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
		// TODO Auto-generated method stub
		String sql = "DELETE FROM bookstore_order_item WHERE id = ?";
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
	public List<OrderItem> findListByOrder(Order order) {
		List<OrderItem> list = new ArrayList<>();
		String sql = "SELECT * FROM bookstore_order_item WHERE order_id = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, order.getId());
			rs = pst.executeQuery();
			while(rs.next()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setId(rs.getString("id"));
				orderItem.setProduct(productDao.findById(rs.getString("product_id")));
				orderItem.setOrder(orderDao.findById(rs.getString("order_id")));
				orderItem.setBuyNum(rs.getInt("buy_num"));
				orderItem.setCreateDate(rs.getTimestamp("create_date"));
				orderItem.setUpdateDate(rs.getTimestamp("update_date"));
				list.add(orderItem);
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
