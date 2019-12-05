package com.bookstore.service.impl;

import java.util.List;
import java.util.UUID;

import com.bookstore.dao.OrderItemDao;
import com.bookstore.dao.impl.OrderItemDaoImpl;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderItem;
import com.bookstore.service.OrderItemService;

public class OrderItemServiceImpl implements OrderItemService {

	private OrderItemDao orderItemDao = new OrderItemDaoImpl();
	
	@Override
	public void insert(OrderItem orderItem) {
		orderItem.setId(UUID.randomUUID().toString());
		orderItemDao.insert(orderItem);
	}

	@Override
	public void delete(String id) {
		orderItemDao.delete(id);
	}

	@Override
	public List<OrderItem> findListByOrder(Order order) {
		List<OrderItem> orderItemList = orderItemDao.findListByOrder(order);
		return orderItemList;
	}

}
