package com.bookstore.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.User;
import com.bookstore.service.UserService;
import com.bookstore.service.impl.UserServiceImpl;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String imgUrl = req.getParameter("imgUrl");
		User user = new User(username,password,email,phone);
		user.setImgUrl(imgUrl);
		userService.addUser(user);
		resp.sendRedirect(req.getContextPath()+"/index");
	}

}
