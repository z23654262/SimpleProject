package com.bookstore.servlet.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bookstore.alipay.AlipayConfig;
import com.bookstore.entity.Order;
import com.bookstore.service.OrderService;
import com.bookstore.service.impl.OrderServiceImpl;

/**
 * 	GET请求   根据订单id跳转到订单支付界面
 * 	POST请求   提交订单的收货信息并更改状态为已支付
 * 
 * @time 2019年11月17日
 */
@WebServlet("/user/payOrder")
public class PayOrderServlet extends HttpServlet {
	
	private OrderService orderService = new OrderServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Order order = orderService.findById(req.getParameter("id"));
		req.setAttribute("order", order);
		req.getRequestDispatcher("/jsp/order/payOrder.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Order order = orderService.findById(req.getParameter("id"));
		order.setReceiveAddress(req.getParameter("receiveAddress"));
		order.setReceiveName(req.getParameter("receiveName"));
		order.setReceivePhone(req.getParameter("receivePhone"));
		order.setPayStatus(1);
		orderService.update(order);
		req.setAttribute("order_no", order.getId());
		req.setAttribute("order_money", String.valueOf(order.getMoney()));
		req.setAttribute("order_name", "Order");
		req.setAttribute("order_description", "Product");
		req.getRequestDispatcher("/jsp/order/alipay.jsp").forward(req, resp);
	}
}
