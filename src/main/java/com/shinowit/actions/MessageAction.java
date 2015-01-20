package com.shinowit.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.shinowit.dao.CommonBaseDAO;
import com.shinowit.entity.MessageEntity;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2014/10/17.
 */
public class MessageAction extends ActionSupport {

	@Resource
	private CommonBaseDAO<MessageEntity> msg_dao;

	private MessageEntity msginfo;

	private String msg(){
		if(null==msginfo){
			this.addFieldError("errorField","请输入留言内容！");
			return INPUT;
		}else{
		msg_dao.insert(getMsginfo());
		return SUCCESS;}
	}

	public MessageEntity getMsginfo() {
		return msginfo;
	}

	public void setMsginfo(MessageEntity msginfo) {
		this.msginfo = msginfo;
	}
}
