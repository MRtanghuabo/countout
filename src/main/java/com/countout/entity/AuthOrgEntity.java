package com.countout.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Sets;

/**
 * 组织机构
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_org")
public class AuthOrgEntity implements Serializable {

	// ==============================Fields========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	/** 名称 */
	@Column(name = "name")
	private String name;
	/** 编码 */
	@Column(name = "code")
	private String code;
	/** 上级部门ID */
	@Column(name = "parent_id")
	private Integer parentId;
	
	/** 电话 */
	@Column(name = "phone")
	private String phone;
	
	/** 传真 */
	@Column(name = "fax")
	private String fax;
	
	/** 所在地址 */
	@Column(name = "address")
	private String address;

	/** 记录状态（1有效，0无效） */
	@Column(name = "state")
	private Integer state = 1;
	
	/** 备注 */
	@Column(name = "remark")
	private String remark;

	/** 层级 */
	@Column(name = "level")
	private Integer level;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "create_id")
	private Integer createId;
	
	@Column(name = "update_time")
	private Date updateTime;
	
	@Column(name = "update_id")
	private Integer updateId;
	
	// ==============================RelevanceFields==================================
	/** 上级机构 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "parent_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthOrgEntity _ParentAuthOrgEntity = null;

	/** 子级机构 */
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REFRESH }, mappedBy = "_ParentAuthOrgEntity")
	private Set<AuthOrgEntity> _ChildrenAuthOrgEntity = Sets.newHashSet();

	// ==============================PropertyAccessors================================

	@Deprecated
	public AuthOrgEntity get_ParentAuthOrgEntity() {
		return _ParentAuthOrgEntity;
	}
	@Deprecated
	public void set_ParentAuthOrgEntity(AuthOrgEntity _ParentAuthOrgEntity) {
		this._ParentAuthOrgEntity = _ParentAuthOrgEntity;
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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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

	@Deprecated
	public Set<AuthOrgEntity> get_ChildrenAuthOrgEntity() {
		return _ChildrenAuthOrgEntity;
	}

	@Deprecated
	public void set_ChildrenAuthOrgEntity(Set<AuthOrgEntity> _ChildrenAuthOrgEntity) {
		this._ChildrenAuthOrgEntity = _ChildrenAuthOrgEntity;
	}
	
}
