package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.Product;

public interface ProductService {
	void insert(Product product);
	void update(Product product);
	void delete(String id);
	Product findById(String id);
	List<Product> findByCategory(String categoryId);
	List<Product> findByName(String name);
	List<Product> findAll();
}
