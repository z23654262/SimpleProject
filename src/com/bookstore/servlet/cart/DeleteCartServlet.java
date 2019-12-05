package com.bookstore.servlet.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.Product;
import com.bookstore.entity.User;
import com.bookstore.service.CartItemService;
import com.bookstore.service.ProductService;
import com.bookstore.service.impl.CartItemServiceImpl;
import com.bookstore.service.impl.ProductServiceImpl;

@WebServlet("/user/deleteCart")
public class DeleteCartServlet extends HttpServlet{
	
	private CartItemService cartItemService = new CartItemServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		cartItemService.delete(id);
		resp.sendRedirect(req.getContextPath()+"/user/cartList");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
