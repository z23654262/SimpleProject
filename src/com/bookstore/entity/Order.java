package com.bookstore.entity;

import java.util.Date;
import java.util.List;

/**
 *	订单实体
 */
public class Order {
	private String 	id;				//订单id
	private Double 	money;			//订单总价
	private String 	receiveAddress;	//收货地址
	private String 	receiveName;	//收货人姓名
	private String 	receivePhone;	//收货电话
	private Integer payStatus;		//支付状态
	private User 	user;			//订单发起用户
	private Date 	createDate;		//创建日期
	private Date 	updateDate;		//更新日期
	
	private List<OrderItem> orderItemList;//订单内商品详细列表
	
	public Order() {
		super();
	}


	public Order(String id, Double money, String receiveAddress, String receiveName, String receivePhone,
			Integer payStatus, User user, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.money = money;
		this.receiveAddress = receiveAddress;
		this.receiveName = receiveName;
		this.receivePhone = receivePhone;
		this.payStatus = payStatus;
		this.user = user;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Double getMoney() {
		return money;
	}


	public void setMoney(Double money) {
		this.money = money;
	}


	public String getReceiveAddress() {
		return receiveAddress;
	}


	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}


	public String getReceiveName() {
		return receiveName;
	}


	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}


	public String getReceivePhone() {
		return receivePhone;
	}


	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}


	public Integer getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
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


	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}


	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	
}
