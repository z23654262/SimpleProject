package com.bookstore.servlet.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Category;
import com.bookstore.service.CategoryService;
import com.bookstore.service.impl.CategoryServiceImpl;

@WebServlet("/manage/categoryEdit")
public class CategoryEditServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		Category category = categoryService.findById(id);
		req.setAttribute("category", category);
		req.getRequestDispatcher("/jsp/manage/categoryUpdate.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String categoryName = req.getParameter("categoryName");
		if(null == id) {
			Category category = new Category();
			category.setCategoryName(categoryName);
			categoryService.insert(category);
		}else{
			Category category = categoryService.findById(id);
			category.setCategoryName(categoryName);
			categoryService.update(category);
		}
		resp.sendRedirect(req.getContextPath()+"/manage/categoryList");
	}

}
