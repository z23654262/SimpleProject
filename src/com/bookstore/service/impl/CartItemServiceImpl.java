package com.bookstore.service.impl;

import java.util.List;
import java.util.UUID;

import com.bookstore.dao.CartItemDao;
import com.bookstore.dao.impl.CartItemDaoImpl;
import com.bookstore.entity.CartItem;
import com.bookstore.entity.User;
import com.bookstore.service.CartItemService;

public class CartItemServiceImpl implements CartItemService{
	
	private CartItemDao cartItemDao = new CartItemDaoImpl();

	@Override
	public void insert(CartItem cartItem) {
		cartItem.setId(UUID.randomUUID().toString());
		cartItemDao.insert(cartItem);		
	}

	@Override
	public void update(CartItem cartItem) {
		cartItemDao.update(cartItem);		
	}

	@Override
	public void delete(String id) {
		cartItemDao.delete(id);		
	}

	
	@Override
	public CartItem findById(String id) {
		CartItem cartItem = cartItemDao.findById(id);
		return cartItem;
	}

	@Override
	public CartItem findById(String id, String productId) {
		CartItem cartItem = cartItemDao.findById(id,productId);
		return cartItem;
	}

	@Override
	public List<CartItem> findListByUser(User user) {
		List<CartItem> cartItemList = cartItemDao.findListByUser(user);
		return cartItemList;
	}
}
