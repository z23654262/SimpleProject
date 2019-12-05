package com.bookstore.entity;

import java.util.Date;

/**
 * 购物车 
 */
public class CartItem {
	private String 	id;				//id
	private Product product;		//商品信息
	private User 	user;			//用户
	private Integer available;		//是否可用
	private Integer num;			//数量
	private Date 	createDate;		//创建时间
	private Date 	updateDate;		//更新时间
	
	
	
	@Override
	public String toString() {
		return "CartItem [id=" + id + ", product=" + product + ", user=" + user + ", available=" + available + ", num="
				+ num + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}

	public CartItem() {
		super();
	}

	public CartItem(String id, Product product, User user, Integer available, Integer num, Date createDate,
			Date updateDate) {
		super();
		this.id = id;
		this.product = product;
		this.user = user;
		this.available = available;
		this.num = num;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	

	public CartItem(Product product, User user, Integer num) {
		super();
		this.product = product;
		this.user = user;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
		this.available = available;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
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
}
