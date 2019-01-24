package com.countout.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 将要推送的消息存入值redis的转换
 * @author Mr.tang
 */
@SuppressWarnings("serial")
public class MessageVo implements Serializable{
	
	/**message表id（消息ID）*/
	private Integer messageId;
	/**要推送的人id*/
	private Integer userId;
	/**推送的标题*/
	private String title;
	/**推送0-顶部走马灯，1-弹出窗口，3-底部走马灯，4-侧边走马灯*/
	private Integer mode;
	/**推送时间*/
	private Date pushTime;
	/**推送次数 0-推送一次，1-每天，2-每周，3-每月*/
	private Integer times;
	/**消息是否已经读取0-未读，1-已读*/
	private Integer isRead = 0;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Integer getIsRead() {
		return isRead;
	}
	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}
}
