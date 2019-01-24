package com.countout.entity;

import java.util.Date;
import java.util.Set;

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
 * 系统用户
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "auth_user")
public class AuthUserEntity implements java.io.Serializable {

	// ==============================Fields===========================================
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	/** 登录名 */
	@Column(name = "username")
	private String username;

	/** 登录密码 */
	@Column(name = "password")
	private String password;

	/** 用户姓名 */
	@Column(name = "name")
	private String name;

	/** 所属机构ID */
	@Column(name = "org_id")
	private Integer orgId;
	
	private String orgName;

	/** 性别(男|女) */
	@Column(name = "sex")
	private String sex;

	/** 出生日期 */
	@Column(name = "birthday")
	private Date birthday;

	/** 身份证号 */
	@Column(name = "id_card")
	private String idCard;

	/** 电话 */
	@Column(name = "phone")
	private String phone;
	/** 手机 */
	@Column(name = "mobile")
	private String mobile;
	/** 邮箱 */
	@Column(name = "email")
	private String email;

	/** 是否可用 */
	@Column(name = "enabled")
	private Integer enabled;

	/** 记录状态（1有效，0无效） */
	@Column(name = "del")
	private Integer del = 1;
	/** 备注 */
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "create_id")
	private Integer createId;
	
	@Column(name = "update_time")
	private Date updateTime;
	
	@Column(name = "update_id")
	private Integer updateId;
	

	// ==============================RelevanceFields==================================
	/** 关联组织机构 */
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "org_id", referencedColumnName = "id", insertable = false, updatable = false)
	private AuthOrgEntity _AuthOrgEntity = null;

	/** 关联用户角色表 */
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
	private Set<AuthUserRoleEntity> _AuthUserRoleEntity = Sets.newHashSet();
	// ==============================PropertyAccessors================================

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Integer getDel() {
		return del;
	}

	public void setDel(Integer del) {
		this.del = del;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public AuthOrgEntity get_AuthOrgEntity() {
		return _AuthOrgEntity;
	}

	public void set_AuthOrgEntity(AuthOrgEntity _AuthOrgEntity) {
		this._AuthOrgEntity = _AuthOrgEntity;
	}

	public Set<AuthUserRoleEntity> get_AuthUserRoleEntity() {
		return _AuthUserRoleEntity;
	}

	public void set_AuthUserRoleEntity(Set<AuthUserRoleEntity> _AuthUserRoleEntity) {
		this._AuthUserRoleEntity = _AuthUserRoleEntity;
	}

}
