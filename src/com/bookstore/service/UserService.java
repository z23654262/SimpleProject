package com.bookstore.service;

import com.bookstore.entity.User;

public interface UserService {
	User getByPhone(String phone);
	User getById(String id);
    void addUser(User user);
    void updateUser(User user);
}
