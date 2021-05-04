package com.fish.statistics.domain;

import java.io.Serializable;

/**
 * @ClassName BaseEntity
 * @Description 封装统计数据的实体类
 * @Author 柚子茶
 * @Date 2021/3/18 15:40
 * @Version 1.0
 */
public class BaseEntity implements Serializable {

	private static final long serialVersionUID = -565836848859348018L;

	/** 名称 */
	private String name;

	/** 数值 */
	private Object value;

	public BaseEntity() {
	}

	public BaseEntity(String name, Object value) {
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "BaseEntity{" +
				"name='" + name + '\'' +
				", value=" + value +
				'}';
	}
}
