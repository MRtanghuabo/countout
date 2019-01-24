package com.countout.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 要推送的消息表
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "message")
public class MessageEntity implements Serializable {
	
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	/**推送的机构集合*/
	@Column(name = "org_ids")
	private String orgIds;
	
	/**推送的角色集合*/
	@Column(name = "role_ids")
	private String roleIds;
	
	/**推送的用户集合*/
	@Column(name = "user_ids")
	private String userIds;
	
	/**消息标题*/
	@Column(name = "title")
	private String title;
	
	/**消息内容*/
	@Column(name = "context")
	private String context;
	
	/**推送0-顶部走马灯，1-弹出窗口，3-底部走马灯，4-侧边走马灯*/
	@Column(name = "mode")
	private Integer mode;
	
	/**推送时间*/
	@Column(name = "push_time")
	private Date pushTime; 
	
	/**推送次数 0-推送一次，1-每天，2-每周，3-每月*/
	@Column(name = "times")
	private Integer times;
	
	/**0-无状态，1-取消推送，2-推送*/
	@Column(name = "state")
	private Integer state = 0;
	
	/**创建人*/
	@Column(name = "create_user")
	private Integer createUser;
	
	/**创建时间*/
	@Column(name = "create_time")
	private Date createTime;
	
	/**修改人*/
	@Column(name = "update_user")
	private Integer updateUser;
	
	/**修改时间*/
	@Column(name = "update_time")
	private Date updateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrgIds() {
		return orgIds;
	}

	public void setOrgIds(String orgIds) {
		this.orgIds = orgIds;
	}

	public String getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}

	public String getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	public Date getPushTime() {
		return pushTime;
	}

	public void setPushTime(Date pushTime) {
		this.pushTime = pushTime;
	}

	public Integer getTimes() {
		return times;
	}

	public void setTimes(Integer times) {
		this.times = times;
	}

	public Integer getCreateUser() {
		return createUser;
	}

	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(Integer updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
}
