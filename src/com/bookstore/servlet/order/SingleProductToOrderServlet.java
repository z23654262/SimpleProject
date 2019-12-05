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
@WebServlet("/user/singleProductToOrder")
public class SingleProductToOrderServlet extends HttpServlet {
	
	private ProductService productService = new ProductServiceImpl();
	
	private OrderService orderService = new OrderServiceImpl();
	
	private OrderItemService orderItemService = new OrderItemServiceImpl();
	
	private CartItemService cartItemService = new CartItemServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String num = req.getParameter("num");
		Double money = Double.parseDouble(req.getParameter("money"));
		User user = (User)req.getSession().getAttribute("User");
		Order order = new Order();
		order.setMoney(money);
		order.setPayStatus(0);
		order.setUser(user);
		orderService.insert(order);
		List<OrderItem> orderItemList = new ArrayList<>();
		Product product = productService.findById(id);
		int numTemp = Integer.parseInt(num);
		OrderItem orderItem = new OrderItem();
		orderItem.setBuyNum(numTemp);
		orderItem.setProduct(product);
		orderItem.setOrder(order);
		orderItemService.insert(orderItem);
		resp.sendRedirect(req.getContextPath()+"/user/payOrder?id="+order.getId());
	}

}
