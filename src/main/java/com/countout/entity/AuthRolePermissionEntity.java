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
 * 角色功能关联
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_role_permission")
public class AuthRolePermissionEntity implements java.io.Serializable {

	// ==============================Fields========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	/** 角色主键id */
	@Column(name = "role_id")
	private Integer roleId;

	/** 功能权限主键id */
	@Column(name = "permission_id")
	private Integer permissionId;

	// ==============================RelevanceFields==================================
	/** 关联角色表 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "role_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthRoleEntity _AuthRoleEntity = null;

	/** 关联功能權限表 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "permission_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthPermissionEntity _AuthPermissionEntity = null;

	// ==============================Methods==========================================
	// ==============================PropertyAccessors================================
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Integer permissionId) {
		this.permissionId = permissionId;
	}

	@Deprecated
	public AuthRoleEntity get_AuthRoleEntity() {
		return _AuthRoleEntity;
	}

	@Deprecated
	public void set_AuthRoleEntity(AuthRoleEntity _AuthRoleEntity) {
		this._AuthRoleEntity = _AuthRoleEntity;
	}

	@Deprecated
	public AuthPermissionEntity get_AuthPermissionEntity() {
		return _AuthPermissionEntity;
	}

	@Deprecated
	public void set_AuthPermissionEntity(AuthPermissionEntity _AuthPermissionEntity) {
		this._AuthPermissionEntity = _AuthPermissionEntity;
	}

}
