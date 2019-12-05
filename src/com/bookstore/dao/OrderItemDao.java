package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Order;
import com.bookstore.entity.OrderItem;

public interface OrderItemDao {
	void insert(OrderItem orderItem);
	void delete(String id);
	List<OrderItem> findListByOrder(Order order);
}
