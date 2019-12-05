package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.User;

public interface CartItemDao {
	void insert(CartItem cartItem);
	void update(CartItem cartItem);
	void delete(String id);
	CartItem findById(String id);
	CartItem findById(String id,String produtId);
	List<CartItem> findListByUser(User user);
}
