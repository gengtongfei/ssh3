package com.shinowit.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.shinowit.dao.CommonBaseDAO;
import com.shinowit.entity.AdminInfoEntity;
import com.shinowit.entity.RoleTypesEntity;
import com.shinowit.entity.UserinfoEntity;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2014/10/15.
 */
public class UserInfoAction extends ActionSupport {


	@Resource
	private CommonBaseDAO<UserinfoEntity> user_dao;
	@Resource
	private CommonBaseDAO<AdminInfoEntity> admin_dao;
	private UserinfoEntity user;

	private List<UserinfoEntity> userList;
	private List<AdminInfoEntity> adminList;
	private String userpass1;
	private int userType;

	@Resource
	private CommonBaseDAO<RoleTypesEntity> cbd;

	private List<RoleTypesEntity> relelist;



	public void validateReg() {
		if((null== getUser().getUserName())|| getUser().getUserName().trim().length()<1){
			this.addFieldError("errorField", "用户名不能为空！！");

		}else if (!Pattern.matches("\\w{4,15}", getUser().getUserName())){
			this.addFieldError("errorField", "用户名必须是字母和数字的组合且长度在(4-15)范围内");
		}
		if((null== getUser().getUserPass())|| getUser().getUserPass().trim().length()<1){
			this.addFieldError("errorField", "密码不能为空");
		}
		if((null== getUserpass1())|| getUserpass1().trim().length()<1){
			this.addFieldError("errorField", "请再次输入密码！");
		}
		if(!getUser().getUserPass().equals(getUserpass1())){
			this.addFieldError("errorField", "两次输入密码不一致！！");
		}
		super.validate();
	}
	public void validateLogin() {
		if((null== getUser().getUserName())|| getUser().getUserName().trim().length()<1){
			this.addFieldError("errorField", "用户名不能为空！！");

		}else if (!Pattern.matches("\\w{4,15}", getUser().getUserName())){
			this.addFieldError("errorField", "用户名必须是字母和数字的组合且长度在(4-15)范围内");
		}
		if((null== getUser().getUserPass())|| getUser().getUserPass().trim().length()<1){
			this.addFieldError("errorField", "密码不能为空");
		}
		if((null== getUserpass1())|| getUserpass1().trim().length()<1){
			this.addFieldError("errorField", "请再次输入密码！");
		}

		super.validate();
	}

	public void validateUpdate() {
		if((null== getUser().getUserName())|| getUser().getUserName().trim().length()<1){
			this.addFieldError("errorField", "用户名不能为空！！");

		}else if (!Pattern.matches("\\w{4,15}", getUser().getUserName())){
			this.addFieldError("errorField", "用户名必须是字母和数字的组合且长度在(4-15)范围内");
		}
	super.validate();
	}

	public String reg() {
		UserinfoEntity user1 = new UserinfoEntity();
		user1.setUserName(getUser().getUserName());
		setUserList(user_dao.findByExample(UserinfoEntity.class, user1));
		if (((getUserList()).size()) > 0) {
			this.addFieldError("errorField", "用户名已存在！！");
			return INPUT;
		} else {
			user_dao.insert(user);
			return "login";
		}
	}

	public String sf(){
		relelist=cbd.listAll(RoleTypesEntity.class);
		return SUCCESS;
	}


	public String login() {
		if (user.getRoleTypesByRoleId().getRoleId()==0) {
			userList = user_dao.findByExample(UserinfoEntity.class, user);
			if ((userList.size() > 0)) {
				return SUCCESS;
			} else {
				this.addFieldError("errorField", "用户名不存在或密码错误！");
				return sf();
			}

		} else if (user.getRoleTypesByRoleId().getRoleId()==1) {
			AdminInfoEntity ad=new AdminInfoEntity();
			ad.setAdminName(user.getUserName());
			ad.setAdminPass(user.getUserPass());
			adminList=admin_dao.findByExample(AdminInfoEntity.class,ad);
			if(adminList.size()>0){
				return SUCCESS;
			}else {
				this.addFieldError("errorField", "用户名不存在或密码错误！");
				return sf();
			}

		}
			return INPUT;
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

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}


	public List<RoleTypesEntity> getRelelist() {
		return relelist;
	}

	public void setRelelist(List<RoleTypesEntity> relelist) {
		this.relelist = relelist;
	}
}
