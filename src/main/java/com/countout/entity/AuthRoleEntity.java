package com.countout.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Sets;

/**
 * 角色管理
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_role")
public class AuthRoleEntity implements Serializable {

	// ==============================Fields========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	/**角色所属机构*/
	@Column(name = "org_id")
	private Integer orgId;

	/** 角色名 */
	@Column(name = "name")
	private String name;

	/** 备注 */
	@Column(name = "remark")
	private String remark;

	/** 记录状态（1有效，0无效） */
	@Column(name = "state")
	private Integer state = 1;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "create_id")
	private Integer createId;
	
	@Column(name = "update_time")
	private Date updateTime;
	
	@Column(name = "update_id")
	private Integer updateId;

	// ==============================RelevanceFields==================================
	/** 关联角色用户表 */
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", referencedColumnName = "id", insertable = false, updatable = false)
	private Set<AuthUserRoleEntity> _AuthUserRoleEntity = Sets.newHashSet();
	/** 关联角色权限表 */
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", referencedColumnName = "id", insertable = false, updatable = false)
	private Set<AuthRolePermissionEntity> _AuthRolePermissionEntity = Sets.newHashSet();
	
	// ==============================Methods==========================================
	// ==============================PropertyAccessors================================
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getOrgId() {
		return orgId;
	}
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
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
	public Set<AuthUserRoleEntity> get_AuthUserRoleEntity() {
		return _AuthUserRoleEntity;
	}
	public void set_AuthUserRoleEntity(Set<AuthUserRoleEntity> _AuthUserRoleEntity) {
		this._AuthUserRoleEntity = _AuthUserRoleEntity;
	}
	public Set<AuthRolePermissionEntity> get_AuthRolePermissionEntity() {
		return _AuthRolePermissionEntity;
	}
	public void set_AuthRolePermissionEntity(Set<AuthRolePermissionEntity> _AuthRolePermissionEntity) {
		this._AuthRolePermissionEntity = _AuthRolePermissionEntity;
	}
}
