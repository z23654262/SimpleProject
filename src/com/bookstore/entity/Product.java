package com.bookstore.entity;

import java.util.Date;

/**
 *	商品实体--书籍信息 
 */
public class Product {
	private String 	 id;			//商品id
	private String 	 name;			//商品姓名
	private String 	 writer;		//作者
	private Category category;		//类别信息
	private Double 	 price;			//价格
	private Integer  storeNum;		//库存
	private String 	 imgUrl;		//图片
	private String 	 description;	//描述
	private Date 	 createDate;	//创建日期
	private Date 	 updateDate;	//更新日期
	
	public Product() {
		super();
	}
	
	public Product(String id, String name, String writer, Category category, Double price, Integer storeNum,
			String imgUrl, String description, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.name = name;
		this.writer = writer;
		this.category = category;
		this.price = price;
		this.storeNum = storeNum;
		this.imgUrl = imgUrl;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	

	public Product(String id,String name, String writer, Category category, Double price, Integer storeNum, String imgUrl,
			String description) {
		super();
		this.id = id;
		this.name = name;
		this.writer = writer;
		this.category = category;
		this.price = price;
		this.storeNum = storeNum;
		this.imgUrl = imgUrl;
		this.description = description;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(Integer storeNum) {
		this.storeNum = storeNum;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
