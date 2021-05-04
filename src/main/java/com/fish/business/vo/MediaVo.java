package com.fish.business.vo;

import com.fish.business.domain.Media;

/**
 * @ClassName MediaVo
 * @Description
 * @Author 柚子茶
 * @Date 2021/3/14 11:53
 * @Version 1.0
 */
public class MediaVo extends Media {

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
