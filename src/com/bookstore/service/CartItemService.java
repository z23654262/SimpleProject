package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.User;

public interface CartItemService {
	void insert(CartItem cartItem);
	void update(CartItem cartItem);
	void delete(String id);
	CartItem findById(String id);
	CartItem findById(String id,String productId);
	List<CartItem> findListByUser(User user);
}
