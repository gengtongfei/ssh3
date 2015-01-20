package com.shinowit.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shinowit.dao.CommonBaseDAO;
import com.shinowit.entity.AdminInfoEntity;
import com.shinowit.entity.RoleTypesEntity;
import com.shinowit.entity.UserinfoEntity;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2014/10/16.
 */
public class LoginAction extends ActionSupport {


	@Resource
	private CommonBaseDAO<UserinfoEntity> user_dao;
	@Resource
	private CommonBaseDAO<AdminInfoEntity> admin_dao;
	private UserinfoEntity user;

	private List<UserinfoEntity> userList;

	private List<AdminInfoEntity> adminList;
	@Resource
	private CommonBaseDAO<RoleTypesEntity> cbd;

	private List<RoleTypesEntity> relelist;


	public void validateLogin() {
		if((null== user.getUserName())|| user.getUserName().trim().length()<1){
			this.addFieldError("errorField", "用户名不能为空！！");

		}else if (!Pattern.matches("\\w{4,15}", user.getUserName())){
			this.addFieldError("errorField", "用户名必须是字母和数字的组合且长度在(4-15)范围内");
		}
		if((null== user.getUserPass())|| user.getUserPass().trim().length()<1){
			this.addFieldError("errorField", "密码不能为空");
		}

		super.validate();
	}


	public String login() {
		if (user.getRoleTypesByRoleId().getRoleId()==0) {
			userList=user_dao.findByExample(UserinfoEntity.class, user);
			if ((userList.size() > 0)) {
				//ServletActionContext.getContext().getSession().put("current_userinfo",user);
				Map<String,Object> session=(Map<String,Object>)ActionContext.getContext().getSession();
				//		Map<String,Object> request=(Map<String,Object>)ActionContext.getContext().get("reuqest");
				session.put("current_userinfo",user);
				return SUCCESS;

			} else {
				this.addFieldError("errorField", "用户名不存在或密码错误！");
				return INPUT;
			}

		} else if (user.getRoleTypesByRoleId().getRoleId()==1) {
			AdminInfoEntity ad=new AdminInfoEntity();
			ad.setAdminName(user.getUserName());
			ad.setAdminPass(user.getUserPass());
			adminList=admin_dao.findByExample(AdminInfoEntity.class,ad);
			if(getAdminList().size()>0){
				return SUCCESS;
			}else {
				this.addFieldError("errorField", "用户名不存在或密码错误！");
				return INPUT;
			}

		}



			if(this.hasErrors()==true){
				return INPUT;
			}
			return SUCCESS;

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

	public List<AdminInfoEntity> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<AdminInfoEntity> adminList) {
		this.adminList = adminList;
	}


}
