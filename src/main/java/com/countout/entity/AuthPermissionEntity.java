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
 * 功能权限管理
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_permission")
public class AuthPermissionEntity implements Serializable {

	// ==============================Fields========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	/** 名称 */
	@Column(name = "name")
	private String name;

	/** 上级功能菜单ID */
	@Column(name = "parent_id")
	private Integer parentId;

	/** 访问路径 */
	@Column(name = "path")
	private String path;

	/** 权限编码 */
	@Column(name = "code")
	private String code;

	/** 类别 */
	@Column(name = "type")
	private Integer type;

	/** 记录状态（1有效，0无效） */
	@Column(name = "state")
	private Integer state = 1;

	/** 备注 */
	@Column(name = "remark")
	private String remark;

	/** 层级 */
	@Column(name = "level")
	private Integer level;

	/** 创建者ID */
	@Column(name = "creator_id")
	private String creatorId;

	/** 创建时间 */
	@Column(name = "create_time")
	private Date createTime;

	/** 修改者ID */
	@Column(name = "updater_id")
	private String updaterId;

	/** 修改时间 */
	@Column(name = "update_time")
	private Date updateTime;
	
	// ==============================RelevanceFields==================================
	/** 关联权限角色表 */
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "permission_id", referencedColumnName = "id", insertable = false, updatable = false)
	private Set<AuthRolePermissionEntity> _AuthRolePermissionEntity = Sets.newHashSet();
	// ==============================PropertyAccessors================================

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

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdaterId() {
		return updaterId;
	}

	public void setUpdaterId(String updaterId) {
		this.updaterId = updaterId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Set<AuthRolePermissionEntity> get_AuthRolePermissionEntity() {
		return _AuthRolePermissionEntity;
	}

	public void set_AuthRolePermissionEntity(Set<AuthRolePermissionEntity> _AuthRolePermissionEntity) {
		this._AuthRolePermissionEntity = _AuthRolePermissionEntity;
	}
}
