package com.bookstore.service.impl;

import java.util.List;
import java.util.UUID;

import com.bookstore.dao.OrderDao;
import com.bookstore.dao.OrderItemDao;
import com.bookstore.dao.impl.OrderDaoImpl;
import com.bookstore.dao.impl.OrderItemDaoImpl;
import com.bookstore.entity.Order;
import com.bookstore.entity.User;
import com.bookstore.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao = new OrderDaoImpl();
	
	private OrderItemDao orderItemDao = new OrderItemDaoImpl();
	
	@Override
	public void insert(Order order) {
		order.setId(UUID.randomUUID().toString());
		orderDao.insert(order);
	}

	@Override
	public void update(Order order) {
		orderDao.update(order);
	}

	@Override
	public void delete(String id) {
		orderDao.delete(id);
	}

	@Override
	public List<Order> findListByUser(User user) {
		List<Order> orderList = orderDao.findListByUser(user);
		for(Order order : orderList) {
			order.setOrderItemList(orderItemDao.findListByOrder(order));
		}
		return orderList;
	}

	@Override
	public Order findById(String id) {
		Order order = orderDao.findById(id);
		order.setOrderItemList(orderItemDao.findListByOrder(order));
		return order;
	}

}
