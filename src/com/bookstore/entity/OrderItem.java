package com.bookstore.entity;

import java.util.Date;

/**
 *	 订单详情实体  订单内商品具体信息
 */
public class OrderItem {
	private String 	id;			//订单详情id
	private Order 	order;		//订单id
	private Product product;	//商品id
	private Integer buyNum;		//购买数量
	private Date 	createDate;	//创建日期
	private Date 	updateDate;	//更新日期
	
	
	public OrderItem() {
		super();
	}

	public OrderItem(String id, Order order, Product product, Integer buyNum, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.order = order;
		this.product = product;
		this.buyNum = buyNum;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
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
