package com.bookstore.servlet.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Product;
import com.bookstore.service.ProductService;
import com.bookstore.service.impl.ProductServiceImpl;

@WebServlet("/searchProduct")
public class SearchProductServlet extends HttpServlet {

	private ProductService productService = new ProductServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("keyword");
		List<Product> productList = productService.findByName(keyword);
		req.setAttribute("productList", productList);
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/jsp/product/productSearch.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
