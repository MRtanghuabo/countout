package com.countout.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 用户角色关联
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_user_role")
public class AuthUserRoleEntity implements java.io.Serializable {

	// ==============================Fields===========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	/** 用户主键id */
	@Column(name = "user_id")
	private Integer userId;

	/** 角色主键id */
	@Column(name = "role_id")
	private Integer roleId;

	// ==============================RelevanceFields==================================
	/** 关联用户表 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthUserEntity _AuthUserEntity = null;

	/** 关联角色表 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "role_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthRoleEntity _AuthRoleEntity = null;

	// ==============================Methods==========================================
	// ==============================PropertyAccessors================================
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Deprecated
	public AuthUserEntity get_AuthUserEntity() {
		return _AuthUserEntity;
	}

	@Deprecated
	public void set_AuthUserEntity(AuthUserEntity _AuthUserEntity) {
		this._AuthUserEntity = _AuthUserEntity;
	}

	@Deprecated
	public AuthRoleEntity get_AuthRoleEntity() {
		return _AuthRoleEntity;
	}

	@Deprecated
	public void set_AuthRoleEntity(AuthRoleEntity _AuthRoleEntity) {
		this._AuthRoleEntity = _AuthRoleEntity;
	}

}
