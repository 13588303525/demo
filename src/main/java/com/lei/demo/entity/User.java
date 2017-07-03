package com.lei.demo.entity;


import javax.persistence.*;
//绑定表
@Entity(name="f_User")
public class User {
	
	public User(){
		super();
	}
	//设定主键与主键策略
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="UserID")
	private Integer UserID;
	
	
	//字段绑定
	@Column(name="UserName",length=32)
	private String UserName;
	
	@Column(name="Password",length=50)
	private String Password;
	
	
	@Column(name="UserType")
	private String UserType;
	


	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getUserType() {
		return UserType;
	}
	public void setUserType(String userType) {
		UserType = userType;
	}

}
