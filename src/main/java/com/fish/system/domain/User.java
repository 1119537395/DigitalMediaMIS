package com.fish.system.domain;

import java.io.Serializable;

/**
 * @ClassName User
 * @Description 用户(user)实体类
 * @Author 柚子茶
 * @Date 2020/11/26 15:07
 * @Version 1.0
 */
public class User implements Serializable {

	private static final long serialVersionUID = 5321992841184396183L;

	private Integer userId;

	private Integer userSex;

	private String userName;

	private String userPhone;

	private String userAccount;

	private String userPassword;

	private Integer userType;

	private String userAvatar;

	/** 用户标识 */
	private String userMark;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserSex() {
		return userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getUserAvatar() {
		return userAvatar;
	}

	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}

	public String getUserMark() {
		return userMark;
	}

	public void setUserMark(String userMark) {
		this.userMark = userMark;
	}
}
