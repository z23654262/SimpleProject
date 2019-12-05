package com.bookstore.servlet.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.User;
import com.bookstore.service.CartItemService;
import com.bookstore.service.impl.CartItemServiceImpl;

@WebServlet("/user/cartList")
public class CartListServlet extends HttpServlet {
	
	private CartItemService cartItemService = new CartItemServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("User");
		List<CartItem> cartItemList = cartItemService.findListByUser(user);
		req.setAttribute("cartItemList", cartItemList);
		req.setAttribute("sign", "cart");
		req.getRequestDispatcher("/jsp/cart/cartList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
