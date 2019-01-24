package com.countout.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 资源管理--车辆信息管理
 * @author Mr.tang
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "car_info")
public class CarInfoManagerEntity implements Serializable {
	
	/** 主键 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	
}
