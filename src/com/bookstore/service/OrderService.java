package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.Order;
import com.bookstore.entity.User;

public interface OrderService {
	void insert(Order order);
	void update(Order order);
	void delete(String id);
	List<Order> findListByUser(User user);
	Order findById(String id);
}
