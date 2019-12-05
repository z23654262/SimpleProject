package com.bookstore.servlet.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderItem;
import com.bookstore.entity.Product;
import com.bookstore.entity.User;
import com.bookstore.service.CartItemService;
import com.bookstore.service.OrderItemService;
import com.bookstore.service.OrderService;
import com.bookstore.service.ProductService;
import com.bookstore.service.impl.CartItemServiceImpl;
import com.bookstore.service.impl.OrderItemServiceImpl;
import com.bookstore.service.impl.OrderServiceImpl;
import com.bookstore.service.impl.ProductServiceImpl;

/**
 * 	生成单个商品订单
 * @time 2019年11月17日
 */
@WebServlet("/user/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {
	
	private OrderService orderService = new OrderServiceImpl();
	
	private OrderItemService orderItemService = new OrderItemServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Order order = orderService.findById(req.getParameter("id"));
		for(OrderItem orderItem:order.getOrderItemList()) {
			orderItemService.delete(orderItem.getId());
		}
		orderService.delete(order.getId());
		resp.sendRedirect(req.getContextPath()+"/user/orderList");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
