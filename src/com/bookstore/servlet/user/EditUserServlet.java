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

@WebServlet("/user/editUser")
public class EditUserServlet extends HttpServlet {

	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/user/userMsg.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = userService.getById(req.getParameter("id"));
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		if(null != username) {
			user.setUsername(username);
		}
		if(null != password) {
			user.setPassword(password);
		}
		if(null != email) {
			user.setEmail(email);
		}
		if(null != phone) {
			user.setPhone(phone);
		}
		userService.updateUser(user);
		if(password!=null) {
			req.getSession().removeAttribute("User");
			resp.sendRedirect(req.getContextPath()+"/index");
		}else {
			req.getSession().setAttribute("User", user);
			resp.sendRedirect(req.getContextPath()+"/user/editUser");
		}
	}

}
