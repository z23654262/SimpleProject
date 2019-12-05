package com.bookstore.servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Category;
import com.bookstore.entity.Product;
import com.bookstore.service.CategoryService;
import com.bookstore.service.ProductService;
import com.bookstore.service.impl.CategoryServiceImpl;
import com.bookstore.service.impl.ProductServiceImpl;

/**
 * 跳转首页
 * @time 2019年11月12日
 */
@WebServlet("/manage/productList")
public class ProductListServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImpl();
	
	private ProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> productList = productService.findAll();
		List<Category> categoryList = categoryService.findAll();
		req.setAttribute("productList", productList);
		req.setAttribute("categoryList", categoryList);
		req.getRequestDispatcher("/jsp/manage/productList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
