package com.bookstore.service.impl;

import java.util.List;
import java.util.UUID;

import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.ProductDao;
import com.bookstore.dao.impl.CategoryDaoImpl;
import com.bookstore.dao.impl.ProductDaoImpl;
import com.bookstore.entity.Category;
import com.bookstore.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDao categoryDao = new CategoryDaoImpl();
	
	private ProductDao productDao = new ProductDaoImpl();
	
	@Override
	public void insert(Category category) {
		category.setId(UUID.randomUUID().toString());
		categoryDao.insert(category);
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);
	}

	@Override
	public void delete(String id) {
		categoryDao.delete(id);
	}

	@Override
	public Category findById(String id) {
		Category category = categoryDao.findById(id);
		return category;
	}

	@Override
	public List<Category> findAll() {
		List<Category> categoryList = categoryDao.findAll();
		for(Category category:categoryList) {
			category.setProducts(productDao.findByCategory(category.getId()));
		}
		return categoryList;
	}
}
