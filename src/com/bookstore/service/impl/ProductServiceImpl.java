package com.bookstore.service.impl;

import java.util.List;
import java.util.UUID;

import com.bookstore.dao.ProductDao;
import com.bookstore.dao.impl.ProductDaoImpl;
import com.bookstore.entity.Product;
import com.bookstore.service.ProductService;

public class ProductServiceImpl implements ProductService{

	private ProductDao productDao = new ProductDaoImpl();
	
	@Override
	public void insert(Product product) {
		product.setId(UUID.randomUUID().toString());
		productDao.insert(product);		
	}

	@Override
	public void update(Product product) {
		productDao.update(product);		
	}

	@Override
	public void delete(String id) {
		productDao.delete(id);		
	}

	@Override
	public Product findById(String id) {
		Product product = productDao.findById(id);
		return product;
	}

	@Override
	public List<Product> findByCategory(String categoryId) {
		List<Product> productList = productDao.findByCategory(categoryId);
		return productList;
	}

	@Override
	public List<Product> findByName(String name) {
		List<Product> productList = productDao.findByName(name);
		return productList;
	}

	@Override
	public List<Product> findAll() {
		List<Product> productList = productDao.findAll();
		return productList;
	}

}
