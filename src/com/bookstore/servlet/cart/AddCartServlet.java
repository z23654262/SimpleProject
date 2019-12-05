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

@WebServlet("/user/addCart")
public class AddCartServlet extends HttpServlet{

	private ProductService productService = new ProductServiceImpl();
	
	private CartItemService cartItemService = new CartItemServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productId = req.getParameter("product_id");
		int num = Integer.parseInt(req.getParameter("num"));
		Product product = productService.findById(productId);
		User user = (User)req.getSession().getAttribute("User");
		CartItem cartItem = cartItemService.findById(user.getId(), productId);
		if(null == cartItem) {
			cartItem = new CartItem(product,user,num);
			cartItemService.insert(cartItem);
		}else {
			if(0 == cartItem.getAvailable()) {
				cartItem.setNum(num);
				cartItemService.insert(cartItem);
			}else {
				cartItem.setNum(cartItem.getNum()+num);
				cartItemService.update(cartItem);
			}
		}
		resp.sendRedirect(req.getContextPath()+"/user/cartList");
	}

}
