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
 *	商品添加和修改
 * @time 2019年11月12日
 */
@WebServlet("/manage/productEdit")
public class ProductEditServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImpl();
	
	private ProductService productService = new ProductServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Product product = (Product) productService.findById(id);
		List<Category> categoryList = categoryService.findAll();
		req.setAttribute("product", product);
		req.setAttribute("categoryList", categoryList);
		req.getRequestDispatcher("/jsp/manage/productUpdate.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String writer = req.getParameter("writer");
		Double price = Double.parseDouble(req.getParameter("price"));
		String categoryId = req.getParameter("categoryId");
		String storeNum = req.getParameter("storeNum");
		String imgUrl = req.getParameter("imgUrl");
		String description = req.getParameter("description");
		if(null == id) {
			Product product = new Product(id,name,writer,categoryService.findById(categoryId),price,Integer.parseInt(storeNum),imgUrl,description);
			productService.insert(product);
		}else {
			int storeNumInt;
			Product product2 = productService.findById(id);
			if(null == storeNum) {
				storeNumInt = product2.getStoreNum();
			}else {
				storeNumInt = Integer.parseInt(storeNum);
			}
			Product product = new Product(id,name,writer,categoryService.findById(categoryId),price,storeNumInt,imgUrl,description);
			if(null == imgUrl) {
				product.setImgUrl(product2.getImgUrl());
			}
			productService.update(product);
		}
		resp.sendRedirect(req.getContextPath()+"/manage/productList");
	}

}
