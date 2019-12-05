package com.bookstore.dao;

import com.bookstore.entity.User;

public interface UserDao {
	User getByPhone(String phone);
	User getById(String id);

    void addUser(User user);
    void updateUser(User user);
}
