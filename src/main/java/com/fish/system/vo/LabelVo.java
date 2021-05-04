package com.fish.system.vo;

import com.fish.system.domain.Label;

/**
 * @ClassName LabelVo
 * @Description 实体类(Label)的属性扩展
 * @Author 柚子茶
 * @Date 2021/1/16 12:22
 * @Version 1.0
 */
public class LabelVo extends Label {

	/**
	 * 分页参数
	 */
	private Integer page;

	/**
	 * 分页参数
	 */
	private Integer limit;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

}
