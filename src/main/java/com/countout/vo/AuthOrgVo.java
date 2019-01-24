package com.countout.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 组织机构
 * @author Mr.tang
 */
@SuppressWarnings("serial")
public class AuthOrgVo implements Serializable {
	
	/** 主键 */
	private Integer id;
	/** 名称 */
	private String name;
	/** 编码 */
	private String code;
	/** 上级部门ID */
	private Integer parentId;
	/** 电话 */
	private String phone;
	/** 传真 */
	private String fax;
	/** 所在地址 */
	private String address;
	/** 备注 */
	private String remark;
	/** 层级 */
	private Integer level;
	
	private Date createTime;
	
	private Integer createId;
	
	private Date updateTime;
	
	private Integer updateId;
	
	/** 子节点# */
	private List<AuthOrgVo> children;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getCreateId() {
		return createId;
	}

	public void setCreateId(Integer createId) {
		this.createId = createId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getUpdateId() {
		return updateId;
	}

	public void setUpdateId(Integer updateId) {
		this.updateId = updateId;
	}

	public List<AuthOrgVo> getChildren() {
		return children;
	}

	public void setChildren(List<AuthOrgVo> children) {
		this.children = children;
	}
}
