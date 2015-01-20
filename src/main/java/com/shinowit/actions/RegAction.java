package com.shinowit.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.shinowit.dao.CommonBaseDAO;
import com.shinowit.entity.UserinfoEntity;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2014/10/17.
 */
public class RegAction extends ActionSupport {
	@Resource
	private CommonBaseDAO<UserinfoEntity> user_dao;
	private UserinfoEntity user;
	private List<UserinfoEntity> userList;
	private String userpass1;

	public void validateReg() {
		if((null== user.getUserName())|| user.getUserName().trim().length()<1){
			this.addFieldError("errorField", "用户名不能为空！！");

		}else if (!Pattern.matches("\\w{4,15}", user.getUserName())){
			this.addFieldError("errorField", "用户名必须是字母和数字的组合且长度在(4-15)范围内");
		}
		if((null== user.getUserPass())|| user.getUserPass().trim().length()<1){
			this.addFieldError("errorField", "密码不能为空");
		}
		if((null== userpass1)|| userpass1.trim().length()<1){
			this.addFieldError("errorField", "请再次输入密码！");
		}
		if(!user.getUserPass().equals(userpass1)){
			this.addFieldError("errorField", "两次输入密码不一致！！");
		}
		super.validate();
	}


	public UserinfoEntity getUser() {
		return user;
	}

	public void setUser(UserinfoEntity user) {
		this.user = user;
	}

	public List<UserinfoEntity> getUserList() {
		return userList;
	}

	public void setUserList(List<UserinfoEntity> userList) {
		this.userList = userList;
	}

	public String getUserpass1() {
		return userpass1;
	}

	public void setUserpass1(String userpass1) {
		this.userpass1 = userpass1;
	}
}
