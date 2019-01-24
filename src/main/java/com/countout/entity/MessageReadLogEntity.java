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
 * 用户读取日志表
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "message_log")
public class MessageReadLogEntity implements Serializable {
	
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	/**消息表id*/
	@Column(name = "message_id")
	private Integer messageId;
	
	/**读取消息的人*/
	@Column(name = "user_id")
	private Integer userId;
	
	/**消息日志创建时间*/
	@Column(name = "create_time")
	private Date createTime;
	
	/**消息是否已经读取0-未读，1-已读*/
	@Column(name = "is_read")
	private Integer isRead = 0;
	
	/**读取消息的时间*/
	@Column(name = "read_time")
	private Date readTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getIsRead() {
		return isRead;
	}

	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}

	public Date getReadTime() {
		return readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}
}
