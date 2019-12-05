package com.bookstore.entity;

import java.util.Date;

/**
 * 用户实体修改
 */
public class User {
	private String 	id;			//用户id
    private String 	username;	//用户名
    private String 	password;	//密码
    private String 	email;		//邮箱
    private String 	phone;		//电话
    private String 	role;		//角色权限
    private String  imgUrl;		//头像图片地址
    private Date 	createDate;	//创建日期 ---注册日期
    private Date 	updateDate;	//数据更新日期
    
    @Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", role=" + role + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}

	public User() {
		super();
	}

	public User(String username, String password, String email, String phone) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}

	public User(String id, String username, String password, String email, String phone, String role, Date createDate,
			Date updateDate) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
