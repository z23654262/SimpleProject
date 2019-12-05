package com.bookstore.entity;

import java.util.Date;
import java.util.List;

/**
 *	类别实体 
 */
public class Category {
	private String 	id;				//类别id
	private String 	categoryName;	//类别名称
	private Date 	createDate;		//创建时间
	private Date 	updateDate;		//更新时间
	private List<Product> products;	//对应分类商品
	
	
	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", createDate=" + createDate + ", updateDate="
				+ updateDate + "]";
	}
	public Category() {
		super();
	}
	public Category(String id, String categoryName, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
