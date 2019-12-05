package com.bookstore.service;

import java.util.List;

import com.bookstore.entity.Category;

public interface CategoryService {
	void insert(Category category);
	void update(Category category);
	void delete(String id);
	Category findById(String id);
	List<Category> findAll();
}
