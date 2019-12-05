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

@WebServlet("/userLogin")
public class LoginServlet extends HttpServlet {
	
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
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		User user = userService.getByPhone(phone);
		String wrongMessage = null;
		if(null == user) {
			wrongMessage = "用户不存在";
			resp.sendRedirect(req.getContextPath()+"/index");
		}else {
			if(!password.equals(user.getPassword())) {
				wrongMessage = "密码错误";
				resp.sendRedirect(req.getContextPath()+"/index");
			}else {
				req.getSession().setAttribute("User", user);
				resp.sendRedirect(req.getContextPath()+"/index");
			}
		}
	}
}
