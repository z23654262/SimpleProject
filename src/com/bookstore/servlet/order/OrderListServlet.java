package com.bookstore.servlet.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Order;
import com.bookstore.entity.User;
import com.bookstore.service.OrderService;
import com.bookstore.service.impl.OrderServiceImpl;

@WebServlet("/user/orderList")
public class OrderListServlet extends HttpServlet {
	
	private OrderService orderService = new OrderServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("User");
		List<Order> orderList = orderService.findListByUser(user);
		req.setAttribute("sign", "order");
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("/jsp/order/orderList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
