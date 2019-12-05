package com.bookstore.service.impl;

import java.util.UUID;

import com.bookstore.dao.UserDao;
import com.bookstore.dao.impl.UserDaoImpl;
import com.bookstore.entity.User;
import com.bookstore.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Override
	public User getById(String id) {
		return userDao.getById(id);
	}

	private UserDao userDao = new UserDaoImpl();

	@Override
	public User getByPhone(String phone) {
		return userDao.getByPhone(phone);
	}

	@Override
	public void addUser(User user) {
		user.setId(UUID.randomUUID().toString());
		userDao.addUser(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

}
